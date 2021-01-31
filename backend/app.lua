local lapis = require("lapis")
local app = lapis.Application()

-- register all endpoints
package.path = package.path .. ";./endpoints/?.lua;./modules/?.lua"
local endpoints = {
  require "resources",
  require "users",
  require "tasks",
  require "goals",
  require "days"
}
for i = 1, #endpoints do
  endpoints[i].use(app)
end

return app
