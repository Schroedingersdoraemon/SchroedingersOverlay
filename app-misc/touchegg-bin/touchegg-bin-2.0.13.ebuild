# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DESCRIPTION=""
HOMEPAGE="https://github.com/JoseExposito/touchegg/releases"
SRC_URI="https://github.com/JoseExposito/${PN%-bin}/releases/download/${PV}/${PN%-bin}_${PV}_amd64.deb"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install(){
	dobin usr/bin/${PN%-bin}
	insinto /usr/share/${PN%-bin}
	doins usr/share/${PN%-bin}/${PN%-bin}.conf
}
