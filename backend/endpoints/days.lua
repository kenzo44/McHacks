local module = {}

local db = require "lapis.db"
local respond_to = require("lapis.application").respond_to
local NOT_IMPLEMENTED = {status = 501}

function module.use(app)
  -- [[ User Days ]]

  -- get days in range
  app:get("/days/:userid", function(self)
    print("Userid DAYS")
    return NOT_IMPLEMENTED
  end)

  -- get single day
  app:get("/day/:userid/:datestamp", function(self)
    return NOT_IMPLEMENTED
  end)
end

return module
