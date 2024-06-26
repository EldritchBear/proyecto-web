{ pkgs, ... }: 

{ 
  languages.elixir.enable = true;
  packages = [
    pkgs.nodejs_21
    pkgs.nodePackages_latest.npm
    pkgs.nodePackages_latest.pnpm
    pkgs.nodePackages_latest.typescript-language-server
  ];
}
