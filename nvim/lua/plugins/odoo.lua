-- ~/.config/nvim/lua/plugins/odoo.lua
local allowed_base_dir = vim.fs.normalize(vim.fn.expand("$HOME/projects/odoo/my_addons"))

local function get_odoo_root(bufnr)
  local path = type(bufnr) == "number" and vim.api.nvim_buf_get_name(bufnr) or bufnr
  if not path or path == "" then
    return nil
  end

  local norm_path = vim.fs.normalize(path)

  -- Si no está dentro de my_addons, devolver nil inmediatamente
  if norm_path:sub(1, #allowed_base_dir) ~= allowed_base_dir and not norm_path:find("/my_addons/", 1, true) then
    return nil
  end

  -- 1. Intentar encontrar .git dentro de my_addons
  local git_root = vim.fs.root(norm_path, ".git")
  if git_root and git_root:sub(1, #allowed_base_dir) == allowed_base_dir then
    return git_root
  end

  -- 2. Si no hay .git, intentar emparejar proyecto/versión (ej. addonspack/18.0)
  local rel_path = norm_path:sub(#allowed_base_dir + 2)
  local project, version = rel_path:match("^([^/]+)/([^/]+)")
  if project and version then
    return allowed_base_dir .. "/" .. project .. "/" .. version
  end

  return allowed_base_dir
end

return {
  {
    "odoo/odoo-neovim",
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        odoo_ls = {
          mason = false,
          cmd = {
            vim.fn.expand("$HOME/.local/share/nvim/odoo/odoo_ls_server"),
            "--config-path",
            vim.fn.expand("$HOME/projects/odoo/odools.toml"),
            "--stdlib",
            vim.fn.expand("$HOME/.local/share/nvim/odoo/typeshed/stdlib"),
          },
          filetypes = { "python", "xml" },
          root_dir = function(bufnr, on_dir)
            local root = get_odoo_root(bufnr)
            if root and on_dir then
              on_dir(root)
            end
            return root
          end,
          settings = {
            Odoo = {
              selectedProfile = "main",
            },
          },
        },
      },
    },
  },
}
