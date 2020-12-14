let pkgs = import <nixpkgs> {};

    buildNodejs = pkgs.callPackage <nixpkgs/pkgs/development/web/nodejs/nodejs.nix> {};
    
    nodejs-10 = buildNodejs {
      enableNpm = true;
      version = "10.23.0";
      sha256 = "07vlqr0493a569i0npwgkxk5wa4vc7j68jsivchg08y2slwn0dgx";
    };

in pkgs.mkShell rec {
  name = "webdev";
  
  buildInputs = with pkgs; [
    nodejs-10
    (yarn.override { nodejs = nodejs-10; })
  ];
}
