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
  local userParams = ParamUtil.Flip(
    {"userid", "username", "email", "address", "bio"}
  )

  -- [[ Base User Registration ]]
  local Users = MODEL:extend("users")

  -- determine if a username exists
  app:get("/users/find/:username", function(self)
    local user = Users:find({username = self.params.username})
    if user then
      return Builder.OK({userid = user.id}, {Location = self.url_for("user", {userid = user.id})})
    end
    return Builder.NotFound()
  end)


  -- GET user and UPDATE user
  app:match("user", "/users/:userid", RESPOND_TO({
    GET = function(self)
      -- Make sure the userid is a number
      local userid = tonumber(self.params.userid)
      if not userid then
        return Builder.BadRequest("userid")
      end

      -- make sure the userid exists
      local user = Users:find(userid)
      if not user then
        return Builder.NotFound()
      end

      local data = {
        username = user.username,
        email = user.email,
        address = user.address,
        bio = user.bio
      }

      return Builder.OK(data)
    end,
    PATCH = JSON_PARAMS(function(self)
      -- Ensure only the "allowed" variables are set.
      local ok, key = ParamUtil.SoftCompare(self.params, userParams)
      if not ok then
        return Builder.BadRequest(key)
      end

      -- Make sure the userid is a number
      local userid = tonumber(self.params.userid)
      if not userid then
        return Builder.BadRequest("userid")
      end

      -- make sure the userid exists
      local user = Users:find(userid)
      if not user then
        return Builder.NotFound()
      end

      local data = {}
      for k, v in pairs(self.params) do
        if k ~= "userid" then
          data[k] = v
        end
      end

      user:update(data)

      return Builder.Updated()
    end),
    DELETE = JSON_PARAMS(function(self)
      -- Make sure the userid is a number
      local userid = tonumber(self.params.userid)
      if not userid then
        return Builder.BadRequest("userid")
      end

      -- make sure the userid exists
      local user = Users:find(userid)
      if not user then
        return Builder.NotFound()
      end

      user:delete()

      return Builder.Updated()
    end)
  })) -- self.params.userid, GET, PATCH

  -- Create user
  app:post("/users/new", JSON_PARAMS(function(self)
    local ok, key = ParamUtil.SoftCompare(self.params, userParams)
    if not ok then
      return Builder.BadRequest(key)
    end

    local t = {
      username = self.params.username,
      email = self.params.email,
      address = self.params.address,
      bio = self.params.bio
    }

    local user = Users:create(self.params)

    if user then
      return Builder.Created({userid = user.id}, {Location = self.url_for("user", {userid = user.id})})
    end

    return Builder.UnknownError(1)
  end))

end

return module
