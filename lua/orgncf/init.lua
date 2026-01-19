local M = {}

function M.setup()
  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  
  -- Only register if not already present
  if not parser_config.orgncf then
    parser_config.orgncf = {
      install_info = {
        -- Points to the local folder where lazy.nvim installed the plugin
        url = vim.fn.fnamemodify(debug.getinfo(1).source:sub(2), ":h:h:h"),
        files = { "src/parser.c" }, -- add "src/scanner.c" if applicable
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
      filetype = "orgncf",
    }
  end

  -- Register file extension
  vim.filetype.add({
    extension = {
      orgncf = "orgncf",
    },
  })
end

return M

