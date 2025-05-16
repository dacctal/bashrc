# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];



  #--------------------------EXPERIMENTS----------------------------#
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  #-----------------------------------------------------------------#



  #--------------------------BOOTLOADER-----------------------------#
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #-----------------------------------------------------------------#



  #--------------------------NETWORKING-----------------------------#
  networking.hostName = "adax"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  
  networking.networkmanager.enable = true;
  #-----------------------------------------------------------------#



  #--------------------------TIME ZONE------------------------------#
  time.timeZone = "America/New_York";
  #-----------------------------------------------------------------#



  #--------------------------INTERNALIZATION------------------------#
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  #-----------------------------------------------------------------#



  #--------------------------X11 KEYMAPS----------------------------#
  # services.xserver = {
  #   layout = "us";
  #   xkbVariant = "";
  # };
  #-----------------------------------------------------------------#



  #--------------------------USER ACCOUNT---------------------------#
  users.users.dot = {
    isNormalUser = true;
    description = "dot";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };
  #-----------------------------------------------------------------#



  #--------------------------UNFREE PACKS---------------------------#
  nixpkgs.config.allowUnfree = true;
  #-----------------------------------------------------------------#



  #--------------------------PACKAGES-------------------------------#
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
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
  grim
  home-manager
  htop
  imv
  kdenlive
  keepassxc
  lsof
  mesa
  mpv
  nerdfonts
  neovim
  obs-studio
  openssh
  pavucontrol
  pipewire
  pipecontrol
  prismlauncher
  pulseaudio
  qbittorrent
  ranger
  signal-desktop
  steam
  sof-firmware
  sway
  swaybg
  syncthing
  tmux
  unzip
  vesktop
  wget
  wayland
  xdg-desktop-portal-wlr
  zsh
  ];

  #-----------------------------------------------------------------#
  


  #--------------------------FONTS----------------------------------#
  fonts.packages = with pkgs; [
  	(nerdfonts.override { fonts = [ "SpaceMono" ]; })
	];
  #-----------------------------------------------------------------#



  #--------------------------EX CONFIGS-----------------------------#
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
#   enableSSHSupport = true;
# };
  programs.neovim = {
      enable = true;
      defaultEditor = true;
  };
  programs.sway = {
      enable = true;
  };
  programs.zsh = {
      enable = true;
  };
#-----------------------------------------------------------------#



#--------------------------SERVICES-------------------------------#
# OPENSSH
  services.openssh.enable = true;

  # XDG PORTAL
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  xdg.portal.enable = true;

  # AUDIO
  security.rtkit.enable = true;
  services.pipewire =
  {
	  enable = true;
	  alsa.enable = true;
	  pulse.enable = true;
	  # jack.enable = true;
  };
  #hardware.pulseaudio.enable = true;
  #hardware.pulseaudio.support32Bit = true;
  #-----------------------------------------------------------------#



  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
