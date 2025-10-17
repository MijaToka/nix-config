{pkgs, ...}:{
	nixpkgs.config = {
		allowUnfree = true;
	};

	programs = {
		firefox.enable = true;
		hyprland.enable = true;
		direnv.enable = true;
	};

	environment.systemPackages = with pkgs; [
		# CLI Utils
		git # Version control
		wget # 
		file # Determine file type
    fzf # Fuzzy finder
		tree # Lists directories in tree structure
		unzip # Compress and de-compress files
		zip
		ffmpeg # Convert audio and video sources
		openssl
		fastfetch # Display computer stats
		neofetch
		cava # TUI audio visualizer
		xorg.xev # Device Input testing
		nh # Nix commands
		usbutils # USB commands
		direnv # Environment management (for vscode)
		vdhcoapp # CoApp to download videos from firefox
    zoxide # Better cd command

    # LaTeX
    (texlive.combine {
		inherit (texlive) scheme-basic standalone varwidth scontents xcolor;
	})

		# Desktop apps
		audacity # Audio-mixing
		rofi
		wofi # App launcher

		# Editors
		neovim # Text editor
		xournalpp # Note taking app
		rnote	
		gimp3 # Image editor

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
