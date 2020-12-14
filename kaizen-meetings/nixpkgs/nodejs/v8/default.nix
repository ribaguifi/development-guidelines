let pkgs = import <nixpkgs> {};

    buildNodejs = pkgs.callPackage <nixpkgs/pkgs/development/web/nodejs/nodejs.nix> {};
    
    nodejs-8 = buildNodejs {
      enableNpm = true;
      version = "8.17.0";
      sha256 = "1zzn7s9wpz1cr4vzrr8n6l1mvg6gdvcfm6f24h1ky9rb93drc3av";
    };

in pkgs.mkShell rec {
  name = "webdev";
  
  buildInputs = with pkgs; [
    nodejs-8
    (yarn.override { nodejs = nodejs-8; })
  ];
}
