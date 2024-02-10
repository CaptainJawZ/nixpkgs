{ lib, stdenv, fetchFromGitLab, rustPlatform, appstream, appstream-glib, cargo
, desktop-file-utils, libadwaita, meson, ninja, pkg-config, rustc
, wrapGAppsHook4, gtk4, blueprint-compiler }:

stdenv.mkDerivation (finalAttrs: {
  pname = "wildcard";
  version = "0.3.2";

  src = fetchFromGitLab {
    domain = "gitlab.gnome.org";
    owner = "World";
    repo = "Wildcard";
    rev = "v${finalAttrs.version}";
    hash = "sha256-/lrS7PcJj0tX31xPZgjyWimAWnDj6n4WSy2vPgnFg5Q=";
  };

  cargoDeps = rustPlatform.fetchCargoTarball {
    inherit (finalAttrs) src;
    name = "${finalAttrs.pname}-${finalAttrs.version}";
    hash = "sha256-nsgprQldgqZIYjIHZciPaf4fxUS6p+p21q/WJWgzUqA=";
  };

  nativeBuildInputs = [
    appstream
    appstream-glib
    desktop-file-utils
    meson
    ninja
    pkg-config
    rustPlatform.cargoSetupHook
    cargo
    rustc
    wrapGAppsHook4
    blueprint-compiler
  ];

  buildInputs = [ gtk4 libadwaita ];

  meta = with lib; {
    description = "Track your time without being tracked";
    homepage = "https://github.com/lakoliu/Furtherance";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
    maintainers = with maintainers; [ CaptainJawZ ];
  };
})
