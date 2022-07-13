# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION=""
HOMEPAGE=""
# SRC_URI=""
EGIT_REPO_URI="https://github.com/glouw/${PN}"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	x11-libs/libX11
	media-libs/libsdl2
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install(){
	emake DESTDIR="${D}" install
}
