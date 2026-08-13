{ inputs, moduleWithSystem, ... }: {
  flake.nixosModules.zsh = moduleWithSystem (
    { self', ... }: {
      nixpkgs.overlays = [ (_: _: { zsh = self'.packages.zsh; }) ];
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        autocd = true;
        syntaxHighlighting.enable = true;
        histSize = 10000;
      };
    }
  );
  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages = {
        zsh =
          let
            flakeDir = "$HOME/.dotfiles";
          in
          inputs.wrapper-modules.wrappers.zsh.wrap {
            inherit pkgs;
            runtimePkgs = with pkgs; [
              nh
              fastfetch
              fzf
              devenv
              direnv
            ];
            zshAliases = {
              os-switch = "${lib.getExe pkgs.nh} os switch ${flakeDir}";
              os-update = "${lib.getExe pkgs.nh} os switch --update ${flakeDir}";
              fastfetch = "${lib.getExe pkgs.fastfetch} && echo";
              ".." = "cd ..";
              nsh = "nix-shell -p";
              viconf = "${self'.packages.nvim} --cmd 'cd ${flakeDir}'";
            };

          };

        ohMyPosh = inputs.wrapper-modules.wrappers.oh-my-posh.wrap {
          inherit pkgs;
          settings = import ./_omp-config.nix;
        };
      };
    };
}
