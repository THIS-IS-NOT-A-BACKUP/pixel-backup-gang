{ pkgs ? import <nixpkgs> {} }:

let

    pbgVersion = "snapshot";
    pbgBuildPackages = with pkgs; [ gnumake gnutar shellcheck ];

in

pkgs.stdenv.mkDerivation {
  pname = "pixel-backup-gang";
  version = pbgVersion;

  src = ./.;

  buildInputs = pbgBuildPackages;

  buildPhase = ''
    make PBG_VERSION=${pbgVersion}
  '';

  installPhase = ''
    mkdir -p $out/share
    cp pixel-backup-gang-${pbgVersion}.tar.gz $out/share/pixel-backup-gang.tar.gz
  '';
}
