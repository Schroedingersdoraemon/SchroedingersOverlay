# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# inherit unpacker

DESCRIPTION=""
HOMEPAGE="https://github.com/clvv/fasd"
SRC_URI="https://github.com/clvv/${PN}/tarball/${PV} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/clvv-${PN}-4822024"

src_prepare(){
	sed -i "s=/usr/local=/usr=" Makefile
	default
}

pkg_postinst(){
	elog "To get fasd working in a shell, some initialization code must be run."
	elog "Put the line below in your shell rc."
	elog 'eval "$(fasd --init auto)"'
	elog "This will setup a command hook that executes on every command and advanced tab completion for zsh and bash."
}
