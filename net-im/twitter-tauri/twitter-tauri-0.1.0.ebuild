# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker desktop xdg

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="${P}.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

MY_PN=${PN/-tauri}

S="${WORKDIR}"

src_install(){
	dobin usr/bin/${MY_PN}
	insinto /usr/share
	doins -r usr/share/icons
	domenu usr/share/applications/${MY_PN}.desktop
}
