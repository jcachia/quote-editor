require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  ## Provides the login_as helper method to log in as a user
  include Warden::Test::Helpers

  # driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
end
