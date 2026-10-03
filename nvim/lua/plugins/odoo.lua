return {
  {
    "odoo/odoo-neovim",
    config = function()
      local allowed_base_dir = vim.fs.normalize(vim.fn.expand("$HOME/projects/odoo/my_addons"))
      vim.lsp.config("odoo_ls", {
        cmd = {
          vim.fn.expand("$HOME/.local/share/nvim/odoo/odoo_ls_server"),
          "--config-path",
          vim.fn.expand("$HOME/projects/odoo/odools.toml"),
          "--stdlib",
          vim.fn.expand("$HOME/.local/share/nvim/odoo/typeshed/stdlib"),
        },
        root_dir = function(bufnr, on_dir)
          local file_path = vim.api.nvim_buf_get_name(bufnr)

          if file_path == "" then
            return nil
          end

          local norm_path = vim.fs.normalize(file_path)

          if norm_path:sub(1, #allowed_base_dir) == allowed_base_dir then
            local rel_path = norm_path:sub(#allowed_base_dir + 2)
            local project, version = rel_path:match("^([^/]+)/([^/]+)")

            if project and version then
              return allowed_base_dir .. "/" .. project .. "/" .. version
            end

            return allowed_base_dir
          end

          return nil
        end,
      })

      vim.lsp.enable("odoo_ls")
    end,
  },
}
