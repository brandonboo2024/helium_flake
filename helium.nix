{
  lib,
  stdenv,
  fetchurl,
  autoPatchelfHook,
  nspr,
  nss,
  atk,
  at-spi2-atk,
  at-spi2-core,
  dbus, cups, expat, alsa-lib,
  libxkbcommon,
  cairo,
  pango,
  systemd,
  mesa,
  libxcb,
  libX11,
  libXcomposite,
  libXdamage,
  libXext,
  libXfixes,
  libXrandr,
  qt6,
}:

stdenv.mkDerivation (finalAttrs: {
    pname = "helium";
    version = "0.10.7.1";


    src = fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/0.10.7.1/helium-0.10.7.1-x86_64_linux.tar.xz";
    hash = "sha256-ZHziopdl8ClZQJUHXtIIb9ok/flZoixMdlLMKf5HUUo=";
    };

    nativeBuildInputs = [
    autoPatchelfHook
    qt6.wrapQtAppsHook
    ];

    buildInputs = [
    nspr
    nss
    atk
    at-spi2-atk
    at-spi2-core
    dbus
    cups
    expat
    alsa-lib
    libxkbcommon
    cairo
    pango
    systemd
    mesa
    libxcb
    libX11
    libXcomposite
    libXdamage
    libXext
    libXfixes
    libXrandr
    qt6.qtbase
    ];

    autoPatchelfIgnoreMissingDeps = [
      "libQt5Core.so.5"
      "libQt5Gui.so.5"
      "libQt5Widgets.so.5"
    ];

    installPhase = ''
      runHook preInstall

      mkdir -p $out/bin $out/lib/helium
      cp -r ./* $out/lib/helium

      ln -s $out/lib/helium/helium $out/bin/helium
      
      mkdir -p $out/share/applications
      cp $out/lib/helium/helium.desktop $out/share/applications

      mkdir -p $out/share/pixmaps
      cp $out/lib/helium/product_logo_256.png $out/share/pixmaps/helium.png


      runHook postInstall
      '';
  
    meta = {
      description = "The Chromium-based web browser made for people, with love.";
      homepage = "https://github.com/imputnet/helium-linux";
      license = lib.licenses.gpl3Only;
      mainProgram = "helium";
      platforms = [ "x86_64-linux" ];
    };
})
