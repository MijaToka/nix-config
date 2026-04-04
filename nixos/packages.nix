{ pkgs, inputs, ... }:
{
  nix.settings = {
    # Cachix services to not have to compile
    trusted-substituters = [ "https://unmojang.cachix.org" ];
    trusted-public-keys = [ "unmojang.cachix.org-1:OfHnbBNduZ6Smx9oNbLFbYyvOWSoxb2uPcnXPj4EDQY=" ];
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  programs = {
    firefox.enable = true; # Browser
    hyprland.enable = true; # Window manager
    direnv.enable = true; # Local environment variables acrivation when entering a directory
    localsend.enable = true; # Airdrop-like file transfer
    zsh.enable = true; # Z shell
    yazi = {
      # Terminal file explorer
      enable = true;
      settings.yazi = { };
    };
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
    nix-index-database.comma.enable = true; # Run applications in nixpkgs cache without installing
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

      ## Navigation & productivity
      fzf # Fuzzy finder
      tree # Lists directories in tree structure
      zoxide # Better cd command
      # tmux ## Moved to programs # Terminal multiplexer

      ## File management
      file # Determine file type
      unzip # Compress and de-compress files
      zip
      ffmpeg # Convert audio and video sources
      openssl # Create private keys and certificates

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
      logseq # Open-source obsidian
      zathura # Minimal file viewer
      sioyek # Zathura alternative

      ## Notetaking
      xournalpp
      # rnote ## Moved to stable branch

      ## Image editor/viewer
      gimp3 # Image editor
      krita # Image editor/digital art platform
      qimgv # Minimal image viewer

      ## MuseApps
      audacity # Audio-mixing (will move to unstable whenever audacity4 drops)
      musescore # Sheet music editing

      wofi # App launcher
      # rofi ## TODO: move my configuration to rofi

      # Media player
      mpv
      vlc

      # Messaging apps
      slack
      mattermost # This is the server (?)
      mattermost-desktop

      # DE and WM stuff
      hyprland # WM
      hyprpaper # WM wall paper (not being used?)
      brightnessctl
      mako # Notification daemon
      quickshell # Shell creating app (in my case top bar)
      kdePackages.dolphin # File manager

      # Networkmanager GUI
      networkmanagerapplet

      # Terminal emulators
      kitty

      #Icons
      adwaita-icon-theme

      # Other
      home-manager
      nwg-displays # To change screen properties in hyprland with a GUI
      gearlever # GUI for instaling AppImages
      vdhcoapp # CoApp to download videos from firefox
      easyeffects # Microphone effects

      # Device drivers
      sc-controller
    ]
    ++ (with inputs.nixpkgs-unstable; [
      osu-lazer-bin
    ])
    ++ (with inputs.nixpkgs-old; [
      rnote
    ])
    ++ (with inputs; [
      zen-browser.packages.${pkgs.system}.default
      # fjord-launcher.packages.${pkgs.system}.default
    ]);
}
