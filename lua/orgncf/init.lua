local M = {}

function M.setup()
  -- 1. Check if Treesitter is even installed
  local ok, parsers = pcall(require, "nvim-treesitter.parsers")
  if not ok then return end

  -- 2. Find the config table without calling a function that might not exist
  local configs = parsers.get_parser_configs
  
  -- If it's a function, call it to get the table
  if type(configs) == "function" then
    configs = configs()
  end

  -- 3. If we found a valid table, add your grammar
  if type(configs) == "table" then
    configs.orgncf = {
      install_info = {
        url = "https://github.com/ovidiu-ionescu/tree-sitter-orgncf",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "orgncf",
    }
  end

  -- 4. Register the file extension
  vim.filetype.add({
    extension = { orgncf = "orgncf" },
  })
end

return M
