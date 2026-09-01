return {
  {
    "odoo/odoo-neovim",
    config = function()
      vim.lsp.config("odoo_ls", {
        cmd = {
          vim.fn.expand("$HOME/.local/share/nvim/odoo/odoo_ls_server"),
          "--config-path",
          vim.fn.expand("$HOME/projects/odoo/odools.toml"),
          "--stdlib",
          vim.fn.expand("$HOME/.local/share/nvim/odoo/typeshed/stdlib"),
        },
      })
      vim.lsp.enable("odoo_ls")
    end,
  },
}
