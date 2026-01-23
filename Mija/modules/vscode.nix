{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles = {
      global = {
        extensions = with pkgs.vscode-extensions; [
          vscodevim.vim
          # theqtcompany.qt-core
          ms-python.python
          ms-toolsai.jupyter
          mkhl.direnv
          arrterian.nix-env-selector
          file-icons.file-icons
          jnoortheen.nix-ide
          tamasfe.even-better-toml
        ];
      };
    };
  };
}
