--[[

]]

-- [[ LAPIS MODULES ]]
local DB = require "lapis.db"
local APPLICATION = require("lapis.application")
local MODEL = require("lapis.db.model").Model

--[[ ETC MODULES ]]
local ParamUtil = require "ParamUtil"
local Builder = require "ResponseBuilder"

--[[ GLOBAL LAPIS CONSTANTS ]]
local RESPOND_TO = APPLICATION.respond_to
local JSON_PARAMS = APPLICATION.json_params

-- [[ GLOBAL CONSTANTS ]]
local NOT_IMPLEMENTED = {status = 501}

--[[ MODULE ]]
local module = {}

function module.use(app)
  local Resources = MODEL:extend("resources")

  app:get("/resources/:resourcename", function(self)
    local resource = Resources:find({description = self.params.resourcename})
    if resource then
      local info = {
        description = resource.description,
        contactType = resource.contact_type,
        contact = resource.contact
      }
      return Builder.OK(info)
    end
    return Builder.NotFound()
  end)
end

return module
