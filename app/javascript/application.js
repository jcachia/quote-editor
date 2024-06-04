// Entry point for the build script in your package.json
import "./controllers"
import "@hotwired/turbo-rails"

// This will disable Turbo Drive application-wide  -- allegedly, I had trouble with this working correctly.
// import { Turbo } from "@hotwired/turbo-rails"
// Turbo.session.drive = false

