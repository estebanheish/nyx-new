{
  inputs,
  user,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixos-cosmic.nixosModules.default
  ];
  environment.localBinInPath = true;
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  home-manager.users.${user} = {
    imports = [
      ../../home-manager/firefox
      ../../home-manager/mpv
      ../../home-manager/ghostty
      ../../home-manager/zathura
    ];
    home.file."bin" = {
      enable = true;
      source = ../../../bin;
      target = ".local/bin";
      recursive = true;
      executable = true;
    };
    services.cliphist.enable = true;
    home.packages = with pkgs; [
      kooha
      wl-clipboard
    ];
  };
}
