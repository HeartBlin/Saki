{
  config.flake.nixosModules.nvidiaSuperbia = { config, pkgs, ... }: {
    nixpkgs.config = {
      allowUnfree = true;
      nvidia.acceptLicense = true;
      cudaSupport = true;
    };

    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];

    boot.blacklistedKernelModules = [ "nouveau" ];

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

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };

        amdgpuBusId = "PCI:6:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };

      nvidiaSettings = false;
      open = true;
      nvidiaPersistenced = true;
    };

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [ nvidia-vaapi-driver ];
      extraPackages32 = with pkgs.pkgsi686Linux; [ nvidia-vaapi-driver  ];
    };
  };
}
