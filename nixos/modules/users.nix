{ pkgs, ... }: {
	programs.zsh.enable = true;

	users = {
		defaultUserShell = pkgs.zsh;

		users.mija = {
			isNormalUser = true;
			description = "Mijail Tokarev";
			extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" ];
			packages = with pkgs; [
				kdePackages.kate
				vscode
			];
		};
	};

	# Enable automatic login for the user.
	services.displayManager.autoLogin.enable = true;
	services.displayManager.autoLogin.user = "mija";
}