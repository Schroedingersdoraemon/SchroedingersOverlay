# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker desktop xdg

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/listen1/listen1_desktop/releases/download/v${PV}/${PN/-bin}_${PV}_linux_amd64.deb"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install(){
	insinto "/opt"
	doins -r "opt/Listen1"
	for i in 16 32 48 64 128 256 512; do
		doicon -s $i usr/share/icons/hicolor/${i}x${i}/apps/${PN/-bin}.png
	done
	domenu usr/share/applications/${PN/-bin}.desktop
	fperms +x /opt/Listen1/listen1
}
