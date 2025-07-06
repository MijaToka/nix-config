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

		# Desktop apps
		audacity
		rofi
		wofi
		mpv

		# DE and WM stuff
		kdePackages.kate
		hyprland

		# Terminal emulators
		kitty
		alacritty

		# Wayland thingis

		# Other
		home-manager

	];
	
	# fonts.packages = with pkgs; [
	# 	nerdfonts
	# ];
}