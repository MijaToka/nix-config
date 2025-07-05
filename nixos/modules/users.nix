{ pkgs, ... }: {
	programs.zsh.enable = true;

	users = {
		defaultUserShell = pkgs.zsh;

		users.mija = {
			isNormalUser = true;
			description = "Mijail Tokarev";
			extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" ];
			packages = with pkgs; [
				vscode
				discord
				obsidian
				zoom-us
				spotify
			];
		};
	};

	# Enable automatic login for the user.
	services.displayManager.autoLogin.enable = true;
	services.displayManager.autoLogin.user = "mija";
}