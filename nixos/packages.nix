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
		
		# Desktop apps
		audacity
		rofi
		wofi
		mpv
		vlc

		# DE and WM stuff
		kdePackages.kate
		hyprland
		waybar
		brightnessctl
		mako

		# Terminal emulators
		kitty
		alacritty

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