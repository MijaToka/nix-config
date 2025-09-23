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
		file
		tree
		unzip
		zip
		ffmpeg
		openssl
		fastfetch
		cava
		xorg.xev
		nh
		usbutils

		# Editors
		neovim
		xournalpp

    # LaTeX
    (texlive.combine {
      inherit (texlive) scheme-basic standalone varwidth scontents xcolor;
    }
    )
		# Desktop apps
		audacity
		rofi
		wofi
		mpv
		vlc
    slack
    mattermost

		# DE and WM stuff
		# kdePackages.kate
		hyprland
		hyprpaper
		waybar
		brightnessctl
		mako
		quickshell

		# Terminal emulators
		kitty
    # alacritty

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