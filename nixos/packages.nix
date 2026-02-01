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
    yazi = {
      enable = true;
      settings.yazi = { };
    };
    appimage = {
      enable = true;
      binfmt = true;
      package = pkgs.appimage-run.override {
        extraPkgs = pkgs: [
          pkgs.ffmpeg
          pkgs.imagemagick
        ];
      };
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

      ## Navigation & productivity
      fzf # Fuzzy finder
      tree # Lists directories in tree structure
      zoxide # Better cd command
      tmux # Terminal multiplexer

      ## File management
      file # Determine file type
      unzip # Compress and de-compress files
      zip
      ffmpeg # Convert audio and video sources
      openssl

      ## Stat display
      fastfetch
      neofetch
      cava # TUI audio visualizer
      htop

      ## Utilities
      xorg.xev # Device Input testing
      nh # Nix commands
      usbutils # USB commands

      # Editors
      ## Text editor
      neovim
      zathura # Minimal file viewer
      sioyek # Zathura alternative

      ## Notetaking
      xournalpp
      # rnote ## Moved to stable branch

      ## Image editor/viewer
      gimp3
      krita
      qimgv

      ## MuseApps
      audacity # Audio-mixing (will move to unstable whenever audacity4 drops)
      musescore

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
    ++ (with inputs.nixpkgs-unstable; [
      osu-lazer-bin
    ])
    ++ (with inputs.nixpkgs-old-gtk; [
      rnote
    ])
    ++ (with inputs; [
      zen-browser.packages."${system}".default
    ]);
}
