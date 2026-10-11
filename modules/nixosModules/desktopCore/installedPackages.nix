{
  self,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.installedPackages = moduleWithSystem (
    { inputs', ... }: { pkgs, ... }: {
      imports = [ self.nixosModules.nvim ];
      config = {
        programs =
          let
            programList = [
              "firefox" # Browser
              "localsend" # Airdrop-like file transfer
              "yazi" # Terminal file explorer
            ];
            enabledPrograms = builtins.listToAttrs (
              map (name: {
                inherit name;
                value = {
                  enable = true;
                };
              }) programList
            );
          in
          enabledPrograms
          // {
            appimage = {
              # Utility to run .AppImage files in NixOS
              enable = true;
              binfmt = true;
              package = pkgs.appimage-run.override {
                extraPkgs = pkgs: [
                  pkgs.ffmpeg
                  pkgs.imagemagick
                ];
              };
            };
            tmux = {
              # Terminal multiplexer
              enable = true;
              baseIndex = 1;
            };
          };

        environment.systemPackages =
          with pkgs;
          [
            # CLI Utils
            ## Version control
            git
            lazygit
            wget # Download files from CLI
            sshfs # SSH FUSE file system

            ## Navigation & productivity
            fzf # Fuzzy finder
            tree # Lists directories in tree structure
            zoxide # Better cd command

            ## File management
            file # Determine file type
            unzip # Compress and de-compress files
            zip
            ffmpeg # Convert audio and video sources
            openssl # Create private keys and certificates

            ## Stat display
            fastfetch
            cava # TUI audio visualizer
            htop

            ## Utilities
            wev # Device Input testing
            nh # Nix commands
            usbutils # USB commands
            keymapp # ZSA keyboard flasher

            # Editors and file viewers
            ## Text editor
            neovim
            zathura # Minimal file viewer
            sioyek # Zathura alternative

            ## Notetaking
            xournalpp
            unstable.rnote

            ## Image editor/viewer
            gimp3 # Image editor
            krita # Image editor/digital art platform
            qimgv # Minimal image viewer

            ## MuseApps
            audacity # Audio-mixing (will move to unstable whenever audacity4 drops)
            musescore # Sheet music editing

            wofi # App launcher

            # Media player
            mpv
            vlc

            # Messaging apps

            # DE and WM stuff
            brightnessctl
            playerctl
            quickshell # Shell creating app (in my case top bar)
            kdePackages.dolphin # File manager

            #Icons and cursors
            adwaita-icon-theme
            bibata-cursors

            # Other
            home-manager
            nwg-displays # To change screen properties in hyprland with a GUI
            gearlever # GUI for instaling AppImages
            easyeffects # Microphone effects
            bottles # Wine prefix manager

            # Device drivers
            sc-controller # Steam game controller

            unstable.ani-cli # Watch anime cli
            zotero # Citations manager

            # Communication
            zapzap
            unstable.discord
            unstable.element-desktop
            slack

            zoom-us
            unstable.mattermost-desktop

            # Unfree software
            vscode
            obsidian
            spotify
          ]
          ++ (with inputs'; [
            zen-browser.packages.default
            # fjord-launcher.packages.${pkgs.system}.default
          ]);
      };
    }
  );
}
