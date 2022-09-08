with import <nixpkgs> {}; 
stdenv.mkDerivation {
  name = "redis-test";

  # Source Code
  # See: https://nixos.org/nixpkgs/manual/#ssec-unpack-phase
  src = ./.;

  buildInputs = [
    (pkgs.python3.withPackages (pythonPackages: with pythonPackages; [
      redis
    ]))
  ];
  #unpackPhase = "true";

  configurePhase = ''
  '';
  buildPhase = ''
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp ${./run.py} $out/bin/redis-test
    chmod a+x $out/bin/redis-test
  '';
  shellHook = ''
    export PATH="$out/bin/:$PATH"
  '';
}
