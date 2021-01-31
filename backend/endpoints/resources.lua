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
  app:get("/resources/:resourcename", function(self)
    return NOT_IMPLEMENTED
  end)
end

return module
