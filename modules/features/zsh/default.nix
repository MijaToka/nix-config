{ inputs, moduleWithSystem, ... }: {
  flake.nixosModules.zsh = moduleWithSystem (
    { self', ... }: { pkgs, ... }: {
      nixpkgs.overlays = [ (_: _: { zsh = self'.packages.zsh; }) ];
      programs = {
        zsh = {
          enable = true;
          enableCompletion = true;
          autosuggestions.enable = true;
          syntaxHighlighting.enable = true;
          histSize = 10000;
        };
        zoxide = {
          enable = true;
          flags = [ "--cmd cd" ];
        };
        direnv.enable = true;
        # TODO comma when I update to 26.11
      };
      users.defaultUserShell = pkgs.zsh;
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
            runtimePkgs =
              (with pkgs; [
                fastfetch
                fzf
                devenv
                direnv
                zoxide
              ])
              ++ [ self'.packages.ohMyPosh ];
            zshAliases = {
              os-switch = "${lib.getExe pkgs.nh} os switch ${flakeDir}";
              os-update = "${lib.getExe pkgs.nh} os switch --update ${flakeDir}";
              fastfetch = "${lib.getExe pkgs.fastfetch} && echo";
              ".." = "cd ..";
              nsh = "nix-shell -p";
              viconf = "${self'.packages.nvim} --cmd 'cd ${flakeDir}'";
            };

            zshrc.content = ''
              autoload -U compinit && compinit

              export EDITOR=nvim
              setopt NO_CASE_GLOB

              ${lib.getExe pkgs.any-nix-shell} zsh --info-right | source /dev/stdin

              source <(${lib.getExe pkgs.fzf} --zsh)
              eval "$(${lib.getExe self'.packages.ohMyPosh} init zsh)"
            '';

          };

        ohMyPosh = inputs.wrapper-modules.wrappers.oh-my-posh.wrap {
          inherit pkgs;
          settings = import ./_omp-config.nix;
        };
      };
    };
}
