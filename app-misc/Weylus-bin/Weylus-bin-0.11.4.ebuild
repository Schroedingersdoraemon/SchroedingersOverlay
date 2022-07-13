# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker desktop

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/H-M-H/${PN%-bin}/releases/download/v${PV}/${PN%-bin}_${PV}_amd64.deb"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install(){
	dobin usr/bin/weylus
	domenu usr/share/applications/weylus.desktop
}
