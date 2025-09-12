{
  config.flake.nixosModules.mangohud = { currentUser, pkgs, ... }: {
    environment.systemPackages = with pkgs; [ mangohud ];
    hjem.users.${currentUser}.files.".config/MangoHud/MangoHud.conf".text = ''
      battery
      cpu_power
      cpu_stats
      cpu_temp
      fps
      frame_timing=1
      frametime=0
      gpu_power
      gpu_stats
      gpu_temp
      horizontal
      hud_no_margin
      legacy_layout=0
      ram
      table_columns=14
      vram
    '';
  };
}
