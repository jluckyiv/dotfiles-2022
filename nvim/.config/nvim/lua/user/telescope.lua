require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "target"
    }
  },
  extensions = {
    dash = {
      dash_app_path = "/Applications/Setapp/Dash.app"
    }
  }
}
