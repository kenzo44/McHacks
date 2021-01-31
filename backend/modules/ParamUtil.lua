local module = {}

local function _compareImpl(t1, t2)
  for k in pairs(t1) do
    if not t2[k] then
      print(string.format("Missing key %s (Value of %s and type %s)", k, t2[k], type(t2[k])))
      return false, k
    end
  end

  return true
end

-- Ensure two tables KEYS are exact. Returns the first incorrect or missing key as
-- second parameter, if they are not the same.
function module.Compare(t1, t2)
  local c1, k1 = _compareImpl(t1, t2)
  local c2, k2 = _compareImpl(t2, t1)
  if not c1 then
    return false, k1
  end
  return false, k2
end

-- Ensure t1 keys are a subset of t2 keys. Returns the first incorrect
-- key as second parameter, if not a subset.
function module.SoftCompare(t1, t2)
  return _compareImpl(t1, t2)
end

function module.Flip(t)
  local t2 = {}
  for i = 1, #t do
    t2[t[i]] = t[i]
  end

  return t2
end

return module
