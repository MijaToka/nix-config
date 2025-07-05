{pkgs, ...}:{
	nixpkgs.config = {
		allowUnfree = true;
	};

	programs = {
		firefox.enable = true;
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

		# Desktop apps
		audacity
		rofi
		wofi
		mpv
		discord
		zoom-us
		obsidian

		home-manager


	];
}