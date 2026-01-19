local M = {}

function M.setup()
  local ok, parsers = pcall(require, "nvim-treesitter.parsers")
  if not ok then return end

  local configs = parsers.get_parser_configs()
  
  -- Registering the grammar
  configs.orgncf = {
    install_info = {
      url = "https://github.com/ovidiu-ionescu/tree-sitter-orgncf",
      files = { "src/parser.c" },
      branch = "main",
    },
    filetype = "orgncf",
  }

  -- Registering the filetype
  vim.filetype.add({
    extension = { orgncf = "orgncf" },
  })
end

return M

