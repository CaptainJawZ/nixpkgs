{ appstream-glib, desktop-file-utils, fetchFromGitLab, gjs, gst_all_1, gtk4, lib
, libadwaita, meson, ninja, pkg-config, stdenv, tracker, wrapGAppsHook4 }:

stdenv.mkDerivation rec {
  pname = "zap-soundboard";
  version = "1.2.3";

  src = fetchFromGitLab {
    owner = "rmnvgr";
    repo = "zap";
    rev = "${version}";
    sha256 = "AHGGcekpARRQjySqTprGLzp102lvf3ZTkpU/nzkeUWc=";
  };

  nativeBuildInputs = [
    appstream-glib
    desktop-file-utils
    gjs
    meson
    ninja
    pkg-config
    wrapGAppsHook4
  ];

  buildInputs = [ gjs gst_all_1.gstreamer gtk4 libadwaita tracker ];

  meta = with lib; {
    description =
      "Play all your favorite sound effects! This handy soundboard makes your livestreams and videocasts more entertaining.";
    homepage = "https://gitlab.com/rmnvgr/zap";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = with maintainers; [ CaptainJawZ ];
  };
}
