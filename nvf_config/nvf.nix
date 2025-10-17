{
  vim = {

    viAlias = true;
    vimAlias = true;

    debugMode = {
      enable = false;
      level = 16;
      logFile = "/tmp/nvim.log";
    };

    lsp = {
      enable = true;

      formatOnSave = true;
      lspkind.enable = false;
      lightbulb.enable = true;
      lspsaga.enable = false;
      trouble.enable = true;
      lspSignature.enable = false;
      otter-nvim.enable = true;
      nvim-docs-view.enable = true;
    };

    autopairs.nvim-autopairs.enable = true;
    autocomplete.blink-cmp.enable = true;
    snippets.luasnip.enable = true;

    filetree = {
      neo-tree.enable = true;
    };

    tabline = {
      nvimBufferline.enable = true;
    };

    treesitter.context.enable = true;
    telescope.enable = true;

    git = {
      enable = true;
      gitsigns = {
        enable = true;
        codeActions.enable = true;
      };
      neogit.enable = true;
    };

    minimap = {
      minimap-vim.enable = true;
      codewindow.enable = true;
    };

    dashboard = {
      dashboard-nvim.enable = false;
      alpha.enable = true;
    };

    notify = {
      nvim-notify.enable = true;
    };

    projects = {
      project-nvim.enable = true;
    };

    utility = { };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    languages = {
      enableTreesitter = true;

      nix.enable = true;
      markdown.enable = true;

      python.enable = true;
      clang.enable = true;
      bash.enable = true;
      css.enable = true;
    };

    visuals = {
      nvim-scrollbar.enable = true;
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;

      highlight-undo.enable = true;
      indent-blankline.enable = true;

      # Fun
      cellular-automaton.enable = false;
    };

    statusline = {
      lualine = {
        enable = true;
        theme = "auto";
      };
    };

    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true;
        setupOpts = {
          direction = "float";
        };
      };
    };

    options = {
      tabstop = 2;
      shiftwidth = 2;
      termguicolors = true;
    };
  };
}

