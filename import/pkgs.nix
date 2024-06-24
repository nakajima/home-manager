{ config, pkgs, ... }: {
  home.packages = [
    pkgs.zsh
    pkgs.starship
    pkgs.atuin
    pkgs.direnv
    pkgs.clang
    pkgs.nixd
    pkgs.nixfmt-rfc-style
		pkgs.nodejs
		pkgs.tree-sitter
  ];
}
