{  pkgs, ... }: {
  programs.neovim = {
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

	home.file.".config/nvim" = {
		source = ./nvim;
		recursive = true;
		onChange = "chown nakajima:nakajima .config/nvim";
	};
}
