# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/jgm/${PN/-bin}/releases/download/${PV}/${PN/-bin}-${PV}-1-amd64.deb -> ${P}.deb"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install(){
	dobin usr/bin/${PN/-bin}
	# dodoc usr/share/man/man1/${PN/-bin}.1.gz
	# docompress -x /usr/share/pandoc-bin-2.18/${PN/-bin}.1.bz2
}
