# Quote Editor

This is an example app using Rails & Turbo - https://www.hotrails.dev/turbo-rails

* created with: `rails new quote-editor --css=sass --javascript=esbuild --database=postgresql`

* uses simple form gem.  init with:
`bin/rails generate simple_form:install`

* load up the fixtures into the dev DB with:
`bin/rails db:fixtures:load`

* some examples of what the `tubro_stream` helper responds to
```
# Remove a Turbo Frame
turbo_stream.remove

# Insert a Turbo Frame at the beginning/end of a list
turbo_stream.append
turbo_stream.prepend

# Insert a Turbo Frame before/after another Turbo Frame
turbo_stream.before
turbo_stream.after

# Replace or update the content of a Turbo Frame
turbo_stream.update
turbo_stream.replace
```
