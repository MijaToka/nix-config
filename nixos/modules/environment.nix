{ pkgs, ... }:
{
  environment = {
    shells = [ pkgs.zsh ];
    variables = {
      EDITOR = "vim";
      SYSTEMD_EDITOR = "vim";
      VISUAL = "vim";
    };
  };
}
