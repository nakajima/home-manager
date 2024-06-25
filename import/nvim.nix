{  pkgs, config, ... }: {
  programs.neovim = {
		package = pkgs.neovim-unwrapped;
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      # base distro
      lsp-zero-nvim
      lazy-nvim
      nvim-lspconfig
      vim-plug
    ];
	};

	xdg.configFile = {
    nvim = {
      source =
        config.lib.file.mkOutOfStoreSymlink
          "${config.home.homeDirectory}/.config/home-manager/import/nvim";
      recursive = true;
    };
  };
}
