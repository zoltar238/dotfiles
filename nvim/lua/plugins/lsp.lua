return {
  "neovim/nvim-lspconfig",
  init = function()
    -- Keep lazyvim default commands
    require("lazyvim.plugins.lsp.keymaps")
    -- Add new command to restart lsp
    vim.api.nvim_create_user_command("LspRestart", function()
      vim.lsp.stop_client(vim.lsp.get_clients())
      vim.cmd("e")
    end, {})
    vim.api.nvim_create_user_command("LspLog", function()
      vim.cmd("tabnew " .. vim.lsp.get_log_path())
    end, {})
  end,
  opts = {
    servers = {
      pyright = {
        root_dir = function(fname)
          if type(fname) == "number" then
            fname = vim.api.nvim_buf_get_name(fname)
          end
          if fname:match("/my_addons/") then
            return nil
          end
          return require("lspconfig.util").root_pattern("pyproject.toml", "setup.py", "setup.cfg", ".git")(fname)
        end,
      },
    },
  },
}
