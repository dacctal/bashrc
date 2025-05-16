{ config, pkgs, lib, ... }:

{
#    imports = [
#        nixvim.homeManagerModules.nixvim
#            nixvim.nixosModules.nixvim
#            nixvim.nixDarwinModules.nixvim
#    ];
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = "dot";
    home.homeDirectory = "/home/dot";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "23.11"; # Please read the comment before changing.

# The home.packages option allows you to install Nix packages into your
# environment.
	    home.packages = with pkgs; [
	    clang
		    cargo
            emacs
		    rustc
		    tree-sitter
            lua
		    lua-language-server
            qemu
            neofetch
		    nil
		    nixpkgs-fmt
		    ripgrep
		    fd
		    famistudio
		    hollywood
		    alsa-utils
		    btop
		    cmake
		    curl
		    famistudio
		    fastfetch
		    floorp
		    foot
		    fuzzel
		    git
            go
		    grim
		    htop
		    imv
		    kdenlive
		    keepassxc
		    lsof
		    mesa
		    mpv
		    nerdfonts
		    obs-studio
		    openssh
		    pavucontrol
		    pipewire
		    pipecontrol
		    prismlauncher
		    pulseaudio
		    qbittorrent
		    ranger
            rustdesk
		    signal-desktop
		    steam
		    sof-firmware
		    sway
		    swaybg
		    syncthing
            tmux
            unzip
            vesktop
            virt-manager
            wget
            wayland
            xdg-desktop-portal-wlr
            zsh
# # Adds the 'hello' command to your environment. It prints a friendly
# # "Hello, world!" when run.
# pkgs.hello

# # It is sometimes useful to fine-tune packages, for example, by applying
# # overrides. You can do that directly here, just don't forget the
# # parentheses. Maybe you want to install Nerd Fonts with a limited number of
# # fonts?
# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

# # You can also create simple shell scripts directly inside your
# # configuration. For example, this adds a command 'my-hello' to your
# # environment:
# (pkgs.writeShellScriptBin "my-hello" ''
#   echo "Hello, ${config.home.username}!"
# '')
            ];

#--------------------------UNFREE PACKS---------------------------#
    nixpkgs.config.allowUnfree = true;
#-----------------------------------------------------------------#

# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
    home.file = {
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;

# # You can also set the file content immediately.
# ".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';
    };

# Home Manager can also manage your environment variables through
# 'home.sessionVariables'. These will be explicitly sourced when using a
# shell provided by Home Manager. If you don't want to manage your shell
# through Home Manager then you have to manually source 'hm-session-vars.sh'
# located at either
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/dot/etc/profile.d/hm-session-vars.sh
#
    home.sessionVariables = {
        EDITOR = "nvim";
    };

    programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        envExtra = ''
            ""
            '';
    };

    programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        plugins = with pkgs.vimPlugins; [
            telescope-nvim
                orgmode
                nvim-treesitter
                undotree
                lsp-zero-nvim
                mason-nvim
                nvim-lspconfig
                autoclose-nvim
                (nvim-treesitter.withPlugins (p: [
                                              p.tree-sitter-nix
                                              p.tree-sitter-vim
                                              p.tree-sitter-bash
                                              p.tree-sitter-lua
                                              p.tree-sitter-python
                                              p.tree-sitter-json
                                              p.tree-sitter-c
                                              p.tree-sitter-java
                                              p.tree-sitter-rust
                                              p.tree-sitter-zig
                ]))
                ];
    };

#    programs.nixvim.enable = true;
# Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
