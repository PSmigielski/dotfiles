{ config,inputs , pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    enableMan = true;
    colorschemes.onedark.enable = true;
    extraConfigLua = ''
    -- Set highlight on search
    vim.o.hlsearch = false

    -- Make line numbers default
    vim.wo.number = true

    -- Enable mouse mode
    vim.o.mouse = 'a'

    -- Sync clipboard between OS and Neovim.
    --  Remove this option if you want your OS clipboard to remain independent.
    --  See `:help 'clipboard'`
    vim.o.clipboard = 'unnamedplus'

    -- Enable break indent
    vim.o.breakindent = true

    -- Save undo history
    vim.o.undofile = true
    -- Case-insensitive searching UNLESS \C or capital in search
    vim.o.ignorecase = true
    vim.o.smartcase = true

    -- Keep signcolumn on by default
    vim.wo.signcolumn = 'yes'

    -- Decrease update time
    vim.o.updatetime = 250
    vim.o.timeoutlen = 300

    -- Set completeopt to have a better completion experience
    vim.o.completeopt = 'menuone,noselect'

    -- NOTE: You should make sure your terminal supports this
    vim.o.termguicolors = true
    '';
    extraPackages = with pkgs;[
      vimPlugins.nvim-web-devicons
    ];
    extraPlugins = with pkgs.vimPlugins;[
      orgmode
    ];
    clipboard.register="unnamedplus";
    keymaps = [
      {
        mode = "n";
        key = "<leader>ne";
        action = "<cmd>NvimTreeToggle<CR>";
        options.desc = "Toggle file tree";
      }
      {
        mode = "n";
        key = "<leader>nf";
        action = "<cmd>NvimTreeFindFile<CR>";
        options.desc = "Show current file in tree";
      }
    ];

    plugins = {
      auto-save = {
        enable = true;
        enableAutoSave = true;
      };
      dashboard = {
        enable=true;
      };
      lsp={
        enable = true;
        servers = {
          ansiblels.enable = true;
          bashls.enable = true;
          gopls.enable = true;
          html.enable = true;
          intelephense.enable = true;
          jsonls.enable = true;
          lua-ls.enable = true;
          marksman.enable = true;
          nil_ls.enable = true;
          nushell.enable = true;
          phpactor.enable = true;
          pylsp.enable = true;
          tsserver.enable = true;
          # Vue support, better than the "vuels"
          volar.enable = true;
          yamlls.enable = true;
          rust-analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          rnix-lsp.enable=true;
        };
      };
      luasnip.enable=true;
      cmp_luasnip.enable=true;
      cmp-treesitter.enable=true;
      which-key.enable=true;
      nvim-autopairs.enable=true;
      neorg.enable=true;
      nvim-tree = {
        enable = true;
      };

      treesitter = {
        enable=true;
        # folding=true;
      };
      barbar={
        enable=true;
        autoHide=true;
        clickable=true;
      };
      nix.enable=true;
      tmux-navigator.enable=true;
      nvim-cmp = {
        enable = true;
        snippet.expand = "luasnip";
        mapping = {
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<CR>" = "cmp.mapping.confirm({ select = false })";
        };
        # NixVim has no mapping presets by default, so the default arrow keys don't work
        # Adding "commandline" to mappingPresets breaks tab completion in normal command line
        # I've never used cmp for the command line (or installed cmp-commandline), so I'll leave it at "insert" for now
        mappingPresets = [ "insert" ];
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
          { name = "path"; }
          { name = "emoji"; }
        ];
      };
      lualine = {
        enable = true;
        iconsEnabled = true;
        theme="onedark";
        componentSeparators = {
          left = " ";
          right = " ";
        };
        sectionSeparators = {
          left = " ";
          right = " ";
        };
      };

      comment-nvim = {
        enable = true;
      };

      telescope = {
        enable = true;
        extensions = {
          fzf-native={
            enable=true;
            caseMode="smart_case";
          };
        };
      };
      noice = {
        enable = true;
        lsp = {
          override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = true;
          };
        };
        cmdline = {
          view = "cmdline";
        };
        presets = {
          bottom_search = true; # use a classic bottom cmdline for search
          command_palette = true; # position the cmdline and popupmenu together
          long_message_to_split = true; # long messages will be sent to a split
          inc_rename = false; # enables an input dialog for inc-rename.nvim
          lsp_doc_border = false; # add a border to hover docs and signature help
        };
      };
      none-ls = {
        enable = true;
      };
    };
  };
}
