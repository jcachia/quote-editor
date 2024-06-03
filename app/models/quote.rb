class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  ## the HTML of the created quote should be broadcasted to users subscribed to the "quotes" stream and prepended to the DOM node with the id of "quotes".
  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
  ## can be shortened to:
  # after_create_commit -> { broadcast_prepend_to "quotes" }
  ## can also submit the  broadcast via async job to reduce performance hit on the page load.
  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  ## Similar methods for create:
  # after_update_commit -> { broadcast_replace_later_to "quotes" }
  ## And destroy, but you can't destroy asynchonously.
  # after_destroy_commit -> { broadcast_remove_to "quotes" }

  ## All of the above can be shortened to one line:
  broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend

end
