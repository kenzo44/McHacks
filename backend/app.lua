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

function app:handle_error(err, trace)
  return {status = 500, json = {error = err, trace = trace}}
end

return app
