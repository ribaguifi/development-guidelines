with import <nixpkgs> {};
mkShell {
  buildInputs = [
    postgresql_9_6 
  ];
}
