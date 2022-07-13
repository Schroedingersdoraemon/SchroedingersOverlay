# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

DESCRIPTION=""
HOMEPAGE="https://www.xm1math.net/texmaker/"
SRC_URI="https://www.xm1math.net/${PN%-bin}/assets/files/${PN%-bin}_${PV}_ubuntu_21_10_amd64.deb -> ${P}.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install(){
	dobin usr/bin/${PN%-bin}
	domenu usr/share/applications/${PN%-bin}.desktop
	doicon usr/share/pixmaps/${PN%-bin}.png
}
