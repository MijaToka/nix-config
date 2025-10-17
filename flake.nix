{
	description = "Nixos config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		stylix = {
			url = "github:danth/stylix/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
		};

		nvf = {
			url = "github:NotAShelf/nvf";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		zen-browser = {
			url = "github:youwen5/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, stylix, nvf, zen-browser, ... }@inputs : 

		let
			system = "x86_64-linux"; 
		in
		
		{

		nixosConfigurations = {
			nixos = nixpkgs.lib.nixosSystem {
				specialArgs = {inherit inputs;};
				inherit system;
				modules = [
					./nixos/configuration.nix
					# inputs.home-manager.nixosModules.default
					# zen-browser.packages.x86_64-linux.default
				];
			};
		};

		homeConfigurations = {
			mija = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.${system};
				modules = [
					./Mija/home.nix
					stylix.homeManagerModules.stylix
					nvf.homeManagerModules.nvf
				];
			};

			};
	};
}
