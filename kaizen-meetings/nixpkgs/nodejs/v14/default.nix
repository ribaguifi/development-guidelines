let pkgs = import <nixpkgs> {};

    buildNodejs = pkgs.callPackage <nixpkgs/pkgs/development/web/nodejs/nodejs.nix> {};
    
    nodejs-14 = buildNodejs {
      enableNpm = true;
      version = "14.15.1";
      sha256 = "1g61vqsgq3jsipw2fckj68i4a4pi1iz1kbw7mlw8jmzp8rl46q81";
    };

in pkgs.mkShell rec {
  name = "webdev";
  
  buildInputs = with pkgs; [
    nodejs-14
    (yarn.override { nodejs = nodejs-14; })
  ];
}
