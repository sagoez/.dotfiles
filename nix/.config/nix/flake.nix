{
  description = "Sam MacOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, config, ... }: {

      nixpkgs.config.allowUnfree = true;
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
          pkgs.delta
          pkgs.rustup
          pkgs.spotify
          pkgs.neovim
          pkgs.mkalias
          pkgs.coursier
          pkgs.k9s
          pkgs.bat
          pkgs.eza
          pkgs.direnv
          pkgs.kubelogin-oidc
          pkgs.kubectl
          pkgs.git-extras
          pkgs.oh-my-posh
          pkgs.gnupg
          pkgs.fzf
          pkgs.duckdb
          pkgs.go
          pkgs.jq
          pkgs.kubectl
          pkgs.kcat
          pkgs.lua-language-server
          pkgs.pandoc
          pkgs.nodejs_22
          pkgs.stow
          pkgs.tree
          pkgs.unixtools.watch
          pkgs.ripgrep
          pkgs.yaml-language-server
          pkgs.nil
          pkgs.zoxide
          pkgs.keycastr
          pkgs.neovide
          pkgs.google-cloud-sdk
          pkgs.ngrok
          pkgs.jetbrains.datagrip
          pkgs.jetbrains.idea-community
          pkgs.jetbrains.rust-rover
          pkgs.teleport
          pkgs.postman
          pkgs.kitty
          pkgs.discord
          pkgs.slack
          pkgs.google-chrome
          pkgs.colorls
          pkgs.pinentry_mac
          pkgs.bartender
          pkgs.raycast
        ];

        # Homebrew needs to be installed on its own!
        homebrew = {
          enable = true;
          brews = [
            "librdkafka"
            "mas"
          ];
          casks = [
            "1password-cli"
            "1password"
          ];
          masApps = {
            "Spark" = 1176895641;
            "Structured" = 1499198946;
          };
          onActivation.cleanup = "zap";
          onActivation.autoUpdate = true;
          onActivation.upgrade = true;
        };


        system.activationScripts.applications.text = let
          env = pkgs.buildEnv {
            name = "system-applications";
            paths = config.environment.systemPackages;
            pathsToLink = "/Applications";
          };
        in
          pkgs.lib.mkForce ''
          # Set up applications.
          echo "setting up /Applications..." >&2
          rm -rf /Applications/Nix\ Apps
          mkdir -p /Applications/Nix\ Apps
          find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
          while read src; do
            app_name=$(basename "$src")
            echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
          done
              '';

      users.users.samuel.home = "/Users/samuel";
      nix.configureBuildUsers = true;
      nix.useDaemon = true;

      system.defaults = {
        dock.autohide = true;
        NSGlobalDomain."com.apple.swipescrolldirection" = false;
        finder.FXPreferredViewStyle = "clmv";
        loginwindow.GuestEnabled = false;
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        dock.mru-spaces = false;
        dock.show-recents = false;
        dock.static-only = false;
        dock.persistent-apps = [ 
          "/Applications/Structured.app/"
          "/Applications/Spark.app/"
          "${pkgs.google-chrome}/Applications/Google\ Chrome.app"
          "${pkgs.discord}/Applications/Discord.app"
          "${pkgs.slack}/Applications/Slack.app"
          "${pkgs.kitty}/Applications/Kitty.app"
        ];
      };


      # List all the custom fonts to be installed
      fonts.packages = [ pkgs.fira-code-nerdfont ];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Enable Touch ID for sudo
      security.pam.enableSudoTouchIdAuth = true;
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."macos" = nix-darwin.lib.darwinSystem {
      modules = [ 
          configuration 
        ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."macos".pkgs;
  };
}
