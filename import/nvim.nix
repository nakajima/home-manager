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
		target = "./nvim";
		recursive = true;
	};
}
