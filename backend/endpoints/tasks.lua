local module = {}

local db = require "lapis.db"
local Application = require("lapis.application")
local respond_to, json_params = Application.respond_to, Application.json_params
local Model = require("lapis.db.model").Model
local NOT_IMPLEMENTED = {status = 501}

local Builder = require "ResponseBuilder"
local ParamUtil = require "ParamUtil"

function module.use(app)
  -- [[ User Tasks ]]
  local Tasks = Model:extend("tasks")

  local taskParams = ParamUtil.Flip(
    {"description"}--"score", "description", "datestamp", "yoserid"}
  )

  -- get tasks
  app:get("tasks", "/tasks/:userid[%d]", function(self)
    return NOT_IMPLEMENTED
  end)

  -- create task
  app:post("/tasks/new", json_params(function(self)
    print("PARAMS IN")
    self.params.test = "FUCKING SOMETHING"
    for k, v in pairs(self.params) do print(k, ": ", v) end
    local ok, key, FUCK = ParamUtil.Compare(self.params, taskParams)
    print("THE FUCKERY: ", FUCK)
    print(ok and "It's all good" or "YOU FUCKING MUPPET")
    if not ok then
      print("BAD THING MISSING: ", key)
      return Builder.BadRequest(key)
    end

    local id = Tasks:create(self.params)

    print("DATA OUT")
    print("ID: ", id)

    return Builder.Created({taskid = id}, {Location = self:url_for("task", {userid = self.params.userid, taskid = id})})
  end))

  -- update or delete task
  app:match("task", "/tasks/:userid[%d]/:taskid[%d]", respond_to({
    GET = function(self)

    end,
    PATCH = function(self)
      return NOT_IMPLEMENTED
    end,
    DELETE = function(self)
      return NOT_IMPLEMENTED
    end
  }))
end

return module
