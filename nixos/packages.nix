{pkgs, ...}:{
	nixpkgs.config = {
		allowUnfree = true;
	};

	programs = {
		firefox.enable = true;
		hyprland.enable = true;
	};

	environment.systemPackages = with pkgs; [
		# CLI Utils
		git
		wget 
		file # Determine file type
		tree # Lists directories in tree structure
		unzip # Compress and de-compress files
		zip
		ffmpeg # Convert audio and video sources
		openssl
		fastfetch # Display computer stats
		neofetch
		cava # TUI audio visualizer
		xorg.xev
		nh # Nix commands
		usbutils # USB commands

    # LaTeX
    (texlive.combine {
      inherit (texlive) scheme-basic standalone varwidth scontents xcolor;
    }
    )

		# Desktop apps
		audacity # Audio-mixing
		rofi
		wofi # App launcher

		# Editors
		neovim # Text editor
		xournalpp # Note taking app

		# Media player
		mpv 	
		vlc

		# Messaging apps
    slack
    mattermost

		# DE and WM stuff
		hyprland
		hyprpaper
		waybar
		brightnessctl
		mako
		quickshell

		# Networkmanager GUI
		# networkmanagerapplet

		# Terminal emulators
		kitty

		#Icons
		adwaita-icon-theme
		
		# Wayland thingis

		# Other
		home-manager

		# Device drivers
		sc-controller
	];
	
	# fonts.packages = with pkgs; [
	# 	nerdfonts
	# ];
}