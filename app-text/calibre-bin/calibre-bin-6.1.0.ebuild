# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://download.calibre-ebook.com/${PV}/calibre-${PV}-x86_64.txz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install(){
	insinto /opt/${PN}
	doins -r *
	fperms +x /opt/${PN}/*
	fperms +x /opt/${PN}/bin/*
	fperms +x /opt/${PN}/libexec/*
	make_desktop_entry "/opt/${PN}/${PN/-bin}" "calibre" "/opt/${PN}/resources/content-server/${PN/-bin}.png" "Utility"
}
