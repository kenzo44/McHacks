--[[
  This module implements the tasks system.
]]

-- [[ LAPIS MODULES ]]
local DB = require "lapis.db"
local APPLICATION = require("lapis.application")
local MODEL = require("lapis.db.model").Model

-- [[ ETC MODULES ]]
local ParamUtil = require "ParamUtil"
local Builder = require "ResponseBuilder"

-- [[ GLOBAL LAPIS CONSTANTS ]]
local RESPOND_TO = APPLICATION.respond_to
local JSON_PARAMS = APPLICATION.json_params

--[[ GLOBAL CONSTANTS ]]
local NOT_IMPLEMENTED = {status = 501}


--[[ MODULE ]]
local module = {}

function module.use(app)
  -- [[ User Tasks ]]
  local Tasks = MODEL:extend("tasks")

  local taskParams = ParamUtil.Flip(
    {"score", "description", "datestamp", "userid"}
  )

  -- get tasks
  app:get("tasks", "/tasks/:userid[%d]", function(self)
    return NOT_IMPLEMENTED
  end)

  -- create a new task.
  app:match("Namedroute", "/tasks/new", RESPOND_TO({
    POST = JSON_PARAMS(function(self)
      local ok, key= ParamUtil.Compare(self.params, taskParams)
      if not ok then
        return Builder.BadRequest(key)
      end

      local t = {
        description = self.params.description,
        score = self.params.score,
        datestamp = self.params.datestamp,
        user_id = self.params.userid
      }
      local task = Tasks:create(t)

      return Builder.Created({taskid = task.id}, { Location = self:url_for("task", {userid = self.params.userid, taskid = task.id})})
    end)}
  ))
  -- create task

  -- update or delete task
  app:match("task", "/tasks/:userid[%d]/:taskid[%d]", RESPOND_TO({
    GET = function(self)
      return NOT_IMPLEMENTED
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
