{ ... }:
{
  home.file.".gitconfig".text = ''
    [user]
      name = Pat Nakajima
      email = patnakajima@gmail.com
    [pull]
      rebase = false
    [fetch]
      prune = true
    [alias]
      b = branch
      ba = branch --all
      co = checkout
      ct = checkout --track
      ci = commit --verbose
      ca = commit --all --verbose
      st = status --short --branch
      up = pull
    [init]
      defaultBranch = main
    '';
}

