local M = {}

function M.setup()
  -- 1. Get the parsers table safely
  local ok, parsers = pcall(require, "nvim-treesitter.parsers")
  if not ok then return end

  -- 2. Register the grammar configuration
  local configs = parsers.get_parser_configs()
  configs.orgncf = {
    install_info = {
      -- This finds the local directory where Lazy downloaded your repo
      url = vim.fn.fnamemodify(debug.getinfo(1).source:sub(2), ":h:h:h"),
      files = { "src/parser.c" },
    },
    filetype = "orgncf",
  }

  -- 3. Map the .orgncf extension to the filetype
  vim.filetype.add({
    extension = {
      orgncf = "orgncf",
    },
  })
end

return M

