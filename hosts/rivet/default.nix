{
  user,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480s

    ../common.nix
    ../../modules/nixos/pipewire
    ../../modules/nixos/hyprland
    ../../modules/nixos/nh
    # ../../modules/nixos/hostsfile
  ];

  _module.args.theme = import ../../modules/home-manager/themes/nord_dark.nix;

  home-manager.users.${user} = {
    imports = [
      # ../../modules/home-manager/pkgs-lists/lsps.nix
      ../../modules/home-manager/pkgs-lists/downloads.nix
      ../../modules/home-manager/pkgs-lists/fancy.nix
      ../../modules/home-manager/pkgs-lists/archives.nix
    ];

    home.packages = with pkgs; [
      # helvum
      # easyeffects
      # obs-studio

      # tdesktop
      # vesktop

      # spotify
      # bitwarden
      # bitwarden-cli

      # libreoffice
      # gimp
      # inkscape

      logseq

      # rustup
      # linuxKernel.packages.linux_zen.perf

      # typst
    ];
  };

  networking.hostName = "rivet";
  console.keyMap = "colemak";

  fonts.packages = with pkgs; [
    # cascadia-code
    ubuntu_font_family
    martian-mono
  ];

  # networking
  hardware.bluetooth.enable = true;
  networking.wireless.iwd.enable = true;
  # networking.firewall = {
  #   allowedTCPPorts = [
  #     22
  #     8000
  #     8080
  #   ];
  #   allowedUDPPorts = [
  #     1900
  #   ];
  # };

  # services
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };
  programs.ssh.startAgent = true;

  # boot
  boot.supportedFilesystems = ["ntfs"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.hostPlatform.system = "x86_64-linux";
}
