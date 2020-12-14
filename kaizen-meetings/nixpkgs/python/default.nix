with import <nixpkgs> {};

let
  pythonEnv = python35.withPackages (ps: [
    ps.numpy
    ps.toolz
    ps.requests
    ps.configparser
    ps.setuptools
    ps.six
    ps.wheel
    ps.websocket_client
    ps.python-engineio
    ps.python-socketio
  ]);
in mkShell {
  buildInputs = [
    pythonEnv
    hello
  ];
}
