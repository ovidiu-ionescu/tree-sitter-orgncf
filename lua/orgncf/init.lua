local M = {}

function M.setup()

  -- To be safest across different nvim-treesitter versions:
  local parsers = require("nvim-treesitter.parsers")
  local configs = parsers.get_parser_configs and parsers.get_parser_configs() or parsers

  if not configs.orgncf then
    configs.orgncf = {
      install_info = {
        -- This gets the path where Lazy installed your repo
        url = vim.fn.fnamemodify(debug.getinfo(1).source:sub(2), ":h:h:h"),
        files = { "src/parser.c" }, 
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
      filetype = "orgncf",
    }
  end

  vim.filetype.add({
    extension = {
      orgncf = "orgncf",
    },
  })
end

return M

