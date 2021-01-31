local module = {}

local db = require "lapis.db"
local respond_to = require("lapis.application").respond_to
local NOT_IMPLEMENTED = {status = 501}

function module.use(app)
  app:get("/resources/:resourcename", function(self)
    return NOT_IMPLEMENTED
  end)
end

return module
