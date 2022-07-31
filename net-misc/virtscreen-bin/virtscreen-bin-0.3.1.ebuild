# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker desktop xdg

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/kbumsik/VirtScreen/releases/download/${PV}/${PN/-bin}.deb -> ${P}.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install(){
	dobin usr/bin/${PN/-bin}
	domenu usr/share/applications/${PN/-bin}.desktop
	doicon usr/share/pixmaps/${PN/-bin}.png
}
