local config = require "lapis.config"

config({"dev", "development"}, {
  port = 8079,
  postgres = {
    database = "choicepoint",
    password = "fuck"
  }
})
