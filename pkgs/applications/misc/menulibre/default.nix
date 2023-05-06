{ lib, stdenv, fetchFromGitHub, girl, desktop-file-utils, pkg-config }:

stdenv.mkDerivation rec {
  pname = "menulibre";
  version = "1.6.0";

  src = fetchFromGitHub {
    owner = "lakoliu";
    repo = "Furtherance";
    rev = "v${version}";
    sha256 = "xshZpwL5AQvYSPoyt9Qutaym5IGBQHWwz4ev3xnVcSk=";
  };

  nativeBuildInputs = [
    appstream-glib
    desktop-file-utils
    meson
    ninja
    pkg-config
    rustPlatform.cargoSetupHook
    rustPlatform.rust.cargo
    rustPlatform.rust.rustc
    wrapGAppsHook4
  ];

  buildInputs = [ dbus glib gtk4 libadwaita sqlite ];

  meta = with lib; {
    description = "Track your time without being tracked";
    homepage = "https://github.com/lakoliu/Furtherance";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
    maintainers = with maintainers; [ CaptainJawZ ];
  };
}
