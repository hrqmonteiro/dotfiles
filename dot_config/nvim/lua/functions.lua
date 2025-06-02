-- :fennel:1748735133
local function create_spec_from_map(map)
  local spec = {}
  local function should_include(module)
    return not (module:match("^modules%.lang") or module:match("^modules%.config"))
  end
  for category, modules0 in pairs(map) do
    for _, module in ipairs(modules0) do
      local module_name = ("modules." .. category .. "." .. module)
      local full_path = nil
      if should_include(module_name) then
        if module:find("/") then
          local parts = vim.split(module, "/")
          local dir = table.concat(parts, ".", 1, (#parts - 1))
          local file = parts[#parts]
          full_path = (dir .. "." .. file)
        else
          full_path = module_name
        end
        table.insert(spec, {import = full_path})
      else
      end
    end
  end
  return spec
end
local function get_nvim_directory()
  return (os.getenv("HOME") .. "/.config/nvim")
end
local function read_servers_from_file(file_path)
  local servers = {}
  local file = io.open(file_path, "r")
  if not file then
    local ___antifnl_rtn_1___ = {}
    return ___antifnl_rtn_1___
  else
  end
  local content = file:read("*a")
  file:close()
  local chunk, load_err = load(content)
  if not chunk then
    local ___antifnl_rtn_1___ = {}
    return ___antifnl_rtn_1___
  else
  end
  local ok, result = pcall(chunk)
  if (ok and (type(result) == "table")) then
    return result
  else
    return {}
  end
end
local function process_files(dir, patterns, servers)
  local nvim_dir = get_nvim_directory()
  local command = ("find \"" .. nvim_dir .. "/" .. dir .. "\" -maxdepth 1 -name \"init.lua\" 2>/dev/null")
  local p = io.popen(command)
  local files = p:read("*a")
  p:close()
  for file in files:gmatch("[^\13\n]+") do
    local file_servers = read_servers_from_file(file)
    for _, server in ipairs(file_servers) do
      table.insert(servers, server)
    end
  end
  return nil
end
local function process_subdirectories(base_path, lang, patterns, servers)
  local nvim_dir = get_nvim_directory()
  for _, pattern in ipairs(patterns) do
    if pattern:match(("^" .. lang .. "%..+")) then
      local subdir = pattern:match(("^" .. lang .. "%.(.+)"))
      if subdir then
        local subdir_path = (base_path .. "/" .. lang .. "/" .. subdir)
        process_files(subdir_path, {}, servers)
      else
      end
    else
    end
  end
  return nil
end
return {["create-spec-from-map"] = create_spec_from_map, ["read-servers-from-file"] = read_servers_from_file, ["process-files"] = process_files, ["process-subdirectories"] = process_subdirectories}