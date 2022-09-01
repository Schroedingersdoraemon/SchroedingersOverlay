# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker desktop xdg

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/ciderapp/cider-releases/releases/download/v${PV}/${PN/-bin}_${PV}_amd64.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install(){
	insinto /opt
	doins -r opt/Cider
	fperms +x /opt/Cider/{chrome-sandbox,chrome_crashpad_handler,cider,libEGL.so,libffmpeg.so,libGLESv2.so,libvk_swiftshader.so,libvulkan.so.1}
	fperms +x /opt/Cider/swiftshader/{libEGL.so,libGLESv2.so}
	domenu usr/share/applications/cider.desktop
	for i in 16 32 48 64 128 256 512; do
		doicon -s $i usr/share/icons/hicolor/$i\x$i/apps/cider.png
	done
}
