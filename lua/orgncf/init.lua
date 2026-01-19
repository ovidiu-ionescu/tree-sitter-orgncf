local M = {}

function M.setup()
  -- 1. Safely check if nvim-treesitter is available
  local status, parsers = pcall(require, "nvim-treesitter.parsers")
  if not status then return end

  -- 2. robustly get the config table (handles both function and table API versions)
  local configs = parsers.get_parser_configs
  if type(configs) == "function" then
    configs = configs()
  end

  -- 3. Register the parser ONLY if it doesn't exist
  if configs and not configs.orgncf then
    configs.orgncf = {
      install_info = {
        -- This points to the folder where Lazy cloned this repo
        url = vim.fn.fnamemodify(debug.getinfo(1).source:sub(2), ":h:h:h"),
        files = { "src/parser.c" }, -- add "src/scanner.c" here if you have one
        branch = "main",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
      filetype = "orgncf",
    }
  end

  -- 4. Register the file extension
  vim.filetype.add({
    extension = {
      orgncf = "orgncf",
    },
  })
end

return M

