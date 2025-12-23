{ pkgs, inputs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
  };

  programs = {
    firefox.enable = true;
    hyprland.enable = true;
    direnv.enable = true;
    localsend.enable = true;
    zsh.enable = true;
  };

  environment.systemPackages =
    with pkgs;
    [
      # CLI Utils

      ## Version control
      git
      lazygit
      wget # Download files from CLI

      ## Navigation & productivity
      fzf # Fuzzy finder
      tree # Lists directories in tree structure
      zoxide # Better cd command
      tmux # Terminal multiplexer

      ## File management
      file # Determine file type
      unzip # Compress and de-compress files
      yazi # Terminal file manager
      zip
      ffmpeg # Convert audio and video sources
      openssl

      ## Stat display
      fastfetch
      neofetch
      cava # TUI audio visualizer

      ## Utilities
      xorg.xev # Device Input testing
      nh # Nix commands
      usbutils # USB commands

      # LaTeX
      (texlive.combine {
        inherit (texlive)
          scheme-basic
          standalone
          varwidth
          scontents
          xcolor
          ;
      })

      # Editors
      ## Text editor
      neovim
      zathura # Minimal file viewer
      sioyek # Zathura alternative

      ## Notetaking
      xournalpp
      # rnote ## Moved to stable branch

      ## Image editor
      gimp3
      krita

      ## Audio editor
      audacity # Audio-mixing
      wofi # App launcher
      # rofi

      # Media player
      mpv
      vlc

      # Messaging apps
      slack
      mattermost
      mattermost-desktop

      # DE and WM stuff
      hyprland # WM
      hyprpaper # WM wall paper (not being used?)
      brightnessctl
      mako # Notification daemon
      quickshell
      kdePackages.dolphin # File manager

      # Networkmanager GUI
      networkmanagerapplet

      # Terminal emulators
      kitty

      #Icons
      adwaita-icon-theme

      # Other
      home-manager
      direnv # Environment management (for vscode)
      vdhcoapp # CoApp to download videos from firefox

      # Device drivers
      sc-controller
    ]
    ++ (with inputs.nixpkgs-old-gtk; [
      rnote
    ])
    ++ (with inputs; [
      zen-browser.packages."${system}".default
    ]);
}
