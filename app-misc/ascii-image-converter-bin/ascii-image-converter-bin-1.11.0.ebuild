# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/TheZoraiz/${PN/-bin}/releases/download/v${PV}/${PN/-bin}_Linux_amd64_64bit.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN/-bin}_Linux_amd64_64bit"

src_install(){
	dobin ${PN/-bin}
}
