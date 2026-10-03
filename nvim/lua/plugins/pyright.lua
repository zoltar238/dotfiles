-- ~/.config/nvim/lua/plugins/pyright.lua
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
          root_dir = function(fname)
            local path = type(fname) == "number" and vim.api.nvim_buf_get_name(fname) or fname
            if not path or path == "" then
              return nil
            end

            local norm_path = vim.fs.normalize(path)

            -- Excluir explícitamente addons de Odoo
            if norm_path:find("/my_addons/", 1, true) then
              return nil
            end

            local root = vim.fs.root(norm_path, {
              "pyproject.toml",
              "setup.py",
              "setup.cfg",
              "requirements.txt",
              "Pipfile",
              ".git",
            })

            return root or vim.fs.dirname(norm_path)
          end,
        },
      },
    },
  },
}
