# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker xdg desktop

DESCRIPTION="3rd party netease cloud music"
HOMEPAGE="https://github.com/trazyn/ieaseMusic"
SRC_URI="https://github.com/trazyn/${PN/-bin}/releases/download/v${PV}/${PN/-bin}-${PV}-linux-amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	app-accessibility/at-spi2-atk
	dev-libs/atk
	dev-libs/expat
	dev-libs/nspr
	dev-libs/nss
	media-libs/alsa-lib
	net-print/cups
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:3
	x11-libs/libX11
	x11-libs/libXScrnSaver
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/libxcb
	x11-libs/pango"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install(){
	insinto "/opt/"
	doins -r "opt/${PN/-bin}"
	fperms +x /opt/${PN/-bin}/{${PN/-bin},libEGL.so,libffmpeg.so,libGLESv2.so,libVkICD_mock_icd.so,swiftshader/{libEGL.so,libGLESv2.so}}
	for i in 16 24 32 48 64 96 128 256; do
		doicon -s $i usr/share/icons/hicolor/${i}x${i}/apps/${PN/-bin}.png
	done
	# dodoc usr/share/doc/iease-music/changelog.gz
	domenu usr/share/applications/${PN/-bin}.desktop
}
