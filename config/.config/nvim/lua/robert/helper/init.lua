local nv_helper = {}

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

function nv_helper.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

return nv_helper
