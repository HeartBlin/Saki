{
  flake.nixosModules.nvidia = { config, pkgs, ... }: {
    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    boot.blacklistedKernelModules = [ "nouveau" ];
    nixpkgs.config = {
      allowUnfree = true;
      nvidia.acceptLicense = true;
      cudaSupport = true;
    };

    environment.systemPackages = with pkgs; [
      btop
      vulkan-tools
      vulkan-loader
      vulkan-extension-layer
      libva
      libva-utils
    ];

    hardware.nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      dynamicBoost.enable = true;
      modesetting.enable = true;
      nvidiaSettings = false;
      open = true;
      nvidiaPersistenced = true;
      powerManagement.enable = true;
      prime = {
        amdgpuBusId = "PCI:6:0:0";
        nvidiaBusId = "PCI:1:0:0";
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    };

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [ nvidia-vaapi-driver ];
      extraPackages32 = with pkgs.pkgsi686Linux; [ nvidia-vaapi-driver ];
    };
  };
}
