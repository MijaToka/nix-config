{ config, lib, ... } : {
  programs.zsh = {

    enable = true;
    
    enableCompletion = true;
    autosuggestion.enable = true;
    autocd = true;
    syntaxHighlighting.enable = true;

    shellAliases = let 
      flakeDir = "~/.dotfiles";
    in 
    {
      os-switch = "nh os switch ${flakeDir}";
      os-update = "nh os switch --update ${flakeDir}";
      hm-switch = "nh home switch ${flakeDir}";  

      sys-pkgs = "nvim ${flakeDir}/nixos/packages.nix";
      usr-pkgs = "nvim ${flakeDir}/nixos/modules/users.nix";
    
      fastfetch = "fastfetch && echo";

      ".." = "cd ..";
      
      initExtra = ''
        source ${flakeDir}/zsh_functions.sh
      '';
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"  
        "sudo"
      ];
    };
    initContent = ''
       zstyle ':completion:*' matcher-list 'm:{a-z}={a-zA-Z}'
    eval "$(zoxide init --cmd cd zsh)"
    '';
  };
}
