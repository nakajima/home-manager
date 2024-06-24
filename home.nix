{...}:

{
  home.username = "nakajima";
  home.homeDirectory = "/home/nakajima";
  home.stateVersion = "24.05";

  imports = [
    ./import/pkgs.nix
    ./import/nvim.nix
    ./import/zsh.nix
    ./import/starship.nix
    ./import/git.nix
  ];

  programs.atuin = {
    enable = true;
    settings = {
      sync_address = "https://atuin.fishmt.net";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
  };
}
