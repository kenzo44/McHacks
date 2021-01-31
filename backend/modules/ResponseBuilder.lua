local module = {}

function module.AllJson(data)
  local default = {status = 500, content_type = "Application/json", json = {}, layout = false}
  if type(data) == "table" then
    for k, v in pairs(data) do
      default[k] = v
    end
  end

  return default
end

function module.All(data)
  local default = {status = 500, layout = false}
  if type(data) == "table" then
    for k, v in pairs(data) do
      default[k] = v
    end
  end

  return default
end

function module.BadRequest(parameter)
  return module.AllJson {
    status = 400,
    json = {
      parameter = parameter
    }
  }
end

function module.NotFound()
  return module.All {
    status = 404
  }
end

function module.OK(body, headers)
  return module.AllJson {
    status = 200,
    json = body,
    headers = headers
  }
end

function module.Created(body, headers)
  return module.AllJson {
    status = 201,
    json = body,
    headers = headers
  }
end

function module.Updated()
  return module.All {status = 205}
end

function module.UnknownError(code)
  return module.All {status = 500, json = {error = "Unknown Error with code " .. tostring(code) .. "."}}
end

return module
