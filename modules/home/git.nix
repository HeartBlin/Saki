{
  config.flake.homeModules.git = { pkgs, ... }: {
    programs.git = {
      enable = true;
      package = pkgs.gitFull;

      userName = "HeartBlin";
      userEmail = "heart.blin+git@outlook.com";

      extraConfig = {
        commit.gpgsign = true;
        gpg.format = "ssh";
        gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
        user.signingKey = "~/.ssh/githubSign.pub";
      };
    };

    home.file = {
      ".ssh/allowed_signers".text = ''
        heart.blin+git@outlook.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBQVa5qlrytNRg/QjBm/gTX+ugYT112xI9WcJuPc7c0h
      '';

      ".ssh/config".text = ''
        Host github.com
          User git
          HostName github.com
          PreferredAuthentications publickey
          IdentityFile ~/.ssh/githubAuth
      '';
    };
  };
}
