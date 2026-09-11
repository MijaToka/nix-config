{
  flake.homeModules.umbriel = {
    programs.umbriel.settings.include = {
      files = [ "~/.config/umbriel/outputs.toml" ];
      optional.files = [
        "~/.config/umbriel/noctalia-initial-theme.toml"
        "~/.config/umbriel/testing.toml"
      ];
    };
  };
}
