{pkgs, ...}:{
	programs = {
		steam = {
			enable = true;
			gamescopeSession.enable = true;
			remotePlay.openFirewall = true;
			dedicatedServer.openFirewall = true;
		};
		gamemode.enable = true;

	};

	environment.sessionVariables = {
		WLR_NO_HARDWARE_CURSORS = "1";
	};

	environment.systemPackages = with pkgs; [
		# Gaming
		lutris
		winetricks
		wineWowPackages.stable
		wineWowPackages.waylandFull
		mangohud
		protonup
	];
}