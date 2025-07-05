{pkgs, ...}:{
	programs = {
		steam = {
			enable = true;
			gamescopeSession.enable = true;

		};
		gamemode.enable = true;

	};

	environment.systemPackages = with pkgs; [
		# Gaming
		lutris-unwrapped
		neofetch
		mangohud
		protonup
	];
}