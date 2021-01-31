local module = {}

local db = require "lapis.db"
local Application = require("lapis.application")
local respond_to, json_params = Application.respond_to, Application.json_params
local Model = require("lapis.db.model").Model
local NOT_IMPLEMENTED = {status = 501}

local Builder = require "ResponseBuilder"
local ParamUtil = require "ParamUtil"

--[[ngx.timer.at(0, function()
  print("querying")
  local x = db.query("select *")
  print("E")
  print(x)
  print("Done query")
end)]]

function module.use(app)
  local userParams = ParamUtil.Flip(
    {"userid", "username", "email", "address", "bio"}
  )

  -- [[ Base User Registration ]]
  local Users = Model:extend("users")

  app:get("/users/find")
  -- GET user and UPDATE user
  app:match("user", "/users/:userid", respond_to({
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
    PATCH = json_params(function(self)
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
    DELETE = json_params(function(self)
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
  app:post("/users/new", function(self)
    local ok, key = ParamUtil.Compare()
    return NOT_IMPLEMENTED
  end)

end

return module
