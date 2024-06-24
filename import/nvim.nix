{ config, pkgs, ... }: {
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

	 extraLuaConfig = ''
		 require("lazy")
		 require('lsp-zero')
		 require('lspconfig').nixd.setup({})
		 
		 local cmp = require'cmp'
		 cmp.setup({
			 snippet = {
				 expand = function(args)
					 vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
				 end
			 },
			 window = {
			 },
			 sources = cmp.config.sources({
				 { name = 'nvim_lsp' },
				 { name = 'vsnip' }, -- For vsnip users.
			 }, {
				 { name = 'buffer' },
			 })
		 })

		 require("lazy").setup({{
				"nvim-treesitter/nvim-treesitter",
				build = ":TSUpdate",
				config = function () 
					local configs = require("nvim-treesitter.configs")

					configs.setup({
							ensure_installed = { "c", "swift", "nix", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
							sync_install = false,
							highlight = { enable = true },
							indent = { enable = true },  
						})
				end
		 }})
	 '';

	 extraConfig = ''
		 source ${pkgs.vimPlugins.vim-plug}/plug.vim
		 call plug#begin()

		 Plug 'neovim/nvim-lspconfig'
		 Plug 'hrsh7th/cmp-nvim-lsp'
		 Plug 'hrsh7th/cmp-buffer'
		 Plug 'hrsh7th/cmp-path'
		 Plug 'hrsh7th/cmp-cmdline'
		 Plug 'hrsh7th/nvim-cmp'
		 Plug 'hrsh7th/cmp-vsnip'
		 Plug 'hrsh7th/vim-vsnip'
		 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

		 set autoindent
		 set noexpandtab
		 set tabstop=2
		 set shiftwidth=2

		 call plug#end()
		 '';
	 };
}
