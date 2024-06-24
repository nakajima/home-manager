{ ... }: {
  programs.starship = {
    enable = true;
    settings = {
      format = "$hostname$directory$character";

      right_format = "$swift$git_branch$all";

      # # Disable the blank line at the start of the prompt
      add_newline = false;

      hostname = {
        ssh_symbol = "󰌘 ";
        format = "[$ssh_symbol$hostname]($style) ";
      };

      os = {
        disabled = false;
        symbols = {
          Macos = "";
          Ubuntu = "";
          NixOS = "󱄅";
        };
      };

      git_metrics = { disabled = false; };

      line_break.disabled = true;

      git_status.disabled = true;

      character = {
        success_symbol = "[\\$](bold green)";
        error_symbol = "[\\$](bold red)";
        vimcmd_symbol = "[<](bold green)";
      };

      directory = {
        truncate_to_repo = false;
        truncation_length = 10;
        read_only = " ro";
        style = "bold cyan";
        before_repo_root_style = "cyan dimmed";
        repo_root_style = "bold cyan";
      };

      swift = {
        format = " ";
        detect_files = ["Package.swift" ".swiftformat"];
      };
    };
  };
}
