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
				whatsapp-for-linux
				audacity
			];
		};
	};

	# Enable automatic login for the user.
	services.displayManager.autoLogin.enable = false;
	services.displayManager.autoLogin.user = "mija";
}