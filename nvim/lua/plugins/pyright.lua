-- ~/.config/nvim/lua/plugins/pyright.lua
local allowed_base_dir = vim.fs.normalize(vim.fn.expand("$HOME/projects/odoo/my_addons"))

local function is_odoo_file(bufnr)
  local path = type(bufnr) == "number" and vim.api.nvim_buf_get_name(bufnr) or bufnr
  if not path or path == "" then
    return false
  end
  local norm_path = vim.fs.normalize(path)
  return norm_path:sub(1, #allowed_base_dir) == allowed_base_dir or norm_path:find("/my_addons/", 1, true) ~= nil
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          cmd = {
            vim.fn.expand("$HOME/.local/share/nvim/mason/bin/pyright-langserver"),
            "--stdio",
          },
          root_dir = function(bufnr, on_dir)
            -- Excluir explícitamente addons de Odoo
            if is_odoo_file(bufnr) then
              return nil
            end

            local fname = type(bufnr) == "number" and vim.api.nvim_buf_get_name(bufnr) or bufnr
            local root = vim.fs.root(bufnr, {
              "pyproject.toml",
              "setup.py",
              "setup.cfg",
              "requirements.txt",
              "Pipfile",
              ".git",
            }) or (fname and fname ~= "" and vim.fs.dirname(fname)) or vim.fn.getcwd()

            if root and on_dir then
              on_dir(root)
            end
            return root
          end,
        },
      },
    },
  },
}
