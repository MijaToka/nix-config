{  pkgs, lib, config, ... } : {
  
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    useTheme = "nordtron";
    settings = { 
      version = 3; 
      blocks = [ 
        # Block 1
        { 
          alignment = "left";
          newline = true;
          segments = [ 
            # Segment 1 (User@Host)
            { foreground = "white";
              style = "plain";
              template = "<green>┏[</>{{ if .SSHSession }}\udb83\udd3d{{ end }}{{ .UserName }}@{{ .HostName }}<green>]</>";
              type = "session";
            } 

            # Segment 2 (Git Status)
            { foreground = "yellow";
              properties = { 
                fetch_stash_count = true;
                fetch_status = true;
                fetch_upstream_icon = true;
              };
              style = "plain";
              template = "<green>--[</>{{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }}<red> ● </>{{ end }}{{ if .Staging.Changed }}<lightYellow> ● </>{{ end }}<green>]</>";
              type = "git";
            } 
            # Segment 3 (Region)
            { foreground = "blue";
              style = "plain";
              template = "<green>--[</>{{.Profile}}{{if .Region}}@{{.Region}}{{end}}<green>]</>";
              type = "aws";
            }
            # Segment (Kubernetes)
            { foreground = "blue";
              style = "plain";
              template = "<green>--[</>{{.Context}}{{if .Namespace}} :: {{.Namespace}}{{end}}<green>]</>";
              type = "kubectl";
            } 
            # Segment (is Root)
            { foreground = "#d8dee9";
              style = "plain";
              template = "<green>[</><green>]</>";
              type = "root";
            } 
            # Segment (CLI Status)
            { foreground = "#d8dee9";
              style = "plain";
              template = "<green>[x</>{{ reason .Code }}<green>]</>";
              type = "status";
            } ];
          type = "prompt";
        }  
        # Block 2 (Path)
        { 
          alignment = "left";
          newline = true;
          segments = [ 
            # Segment OS
            {
              type = "os";
              style = "plain";
              foreground = "white";
              template = "<green>┖[</>{{ if .WSL }}WSL with {{ end }}{{ .Icon }}<green>]</>";
            }
            # Segment (Path)
            { foreground = "white";
              properties = {
                style = "full";
              };
              style = "plain";
              template = "<green>[</>{{ .Path }}<green>]</>";
              type = "path";
            } ];
          type = "prompt";
        } 
        # Right block 3 (Exec time)
        {
          alignment = "right";
          type = "rprompt";
          overflow = "hidden";
          segments = [ {
            type = "executiontime";
            foreground = "lightYellow";
            style = "plain";
            template = "{{ .FormattedMs }}";
            properties = {
              style = "austin";
            };
          } ];
        }
        # Block 3 (Prompt)
        { 
          alignment = "left";
          newline = true;
          segments = [ { 
            foreground = "green";
            style = "plain";
            template = "  ";
            type = "text";
          } ];
          type = "prompt";
        } 
      ];
      # Transient prompt 
      transient_prompt = { 
        foreground = "green";
        template = "  ";
      };
      final_space = true;
      upgrade = { auto = false;
        interval = "168h";
        notice = false;
        source = "cdn";
      };
    };
  };
}
