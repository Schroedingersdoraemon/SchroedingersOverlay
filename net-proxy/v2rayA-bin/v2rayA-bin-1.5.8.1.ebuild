# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker desktop xdg

MY_PN="v2raya"

DESCRIPTION=""
HOMEPAGE="https://github.com/v2rayA/v2rayA"
SRC_URI="https://github.com/v2rayA/v2rayA/releases/download/v${PV}/installer_debian_amd64_${PV}.deb -> ${P}-amd64.deb"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

QA_PREBUILT="usr/bin/${MY_PN}"

src_install(){
	dobin usr/bin/${MY_PN}
	newinitd "${FILESDIR}/${MY_PN}.initd" ${MY_PN}
	doicon -s 512 usr/share/icons/hicolor/512x512/apps/${MY_PN}.png
	domenu usr/share/applications/${MY_PN}.desktop
}
