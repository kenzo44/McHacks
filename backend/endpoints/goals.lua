local module = {}

local db = require "lapis.db"
local respond_to = require("lapis.application").respond_to
local NOT_IMPLEMENTED = {status = 501}

function module.use(app)
  -- [[ User Goals ]]

  -- get goals
  app:get("/goals/:userid", function(self)
    return NOT_IMPLEMENTED
  end)

  -- create goal
  app:post("/goals/:userid/new", function(self)
    return NOT_IMPLEMENTED
  end)

  -- update or delete goal
  app:match("/goals/:userid/:goalid", respond_to({
    PATCH = function(self)
      return NOT_IMPLEMENTED
    end,
    DELETE = function(self)
      return NOT_IMPLEMENTED
    end
  }))
end

return module
