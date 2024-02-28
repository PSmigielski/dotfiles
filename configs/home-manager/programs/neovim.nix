{ inputs , pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    #Language Servers
    lua-language-server #Lua
    nil
    nixd 
    gopls #Golang
    rust-analyzer #Rust
    zls #Zig
    phpactor #php 
    csharp-ls # C#
    yaml-language-server #yaml
    rPackages.languageserver #R
    clang-tools #C
    jdt-language-server #java 
    python311Packages.python-lsp-server
    #pkgs_stable.python311Packages.jedi-language-server #Python
    # haskellPackages.hls # Haskell
    nodePackages_latest.vscode-langservers-extracted #HTML,CSS, JSON
    nodePackages_latest.vscode-langservers-extracted #HTML,CSS, JSON
    nodePackages_latest.grammarly-languageserver #Markdown
    nodePackages_latest.typescript-language-server #Javascript and Typescript
    nodePackages_latest.bash-language-server #Bash
    nodePackages_latest.dockerfile-language-server-nodejs #Dockerfiles
    nodePackages_latest.yaml-language-server #Yaml
    tree-sitter
    nodePackages_latest.nodejs
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-packer
      telescope-nvim
      harpoon
      nvim-treesitter
      nvim-cmp
      nvim-tree-lua
    ];

  };

  #xdg.configFile = {
  #  "nvim".source = "${inputs.self}/nvim";
  #};
}
