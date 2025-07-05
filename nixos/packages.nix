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

		home-manager
		
		# DE and WM stuff
		kdePackages.kate
		hyprland

		# Terminal emulators
		kitty
		alacritty
	];
}