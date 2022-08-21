# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="DDraceNetwork, a cooperative racing mod of Teeworlds"
HOMEPAGE="https://ddnet.tw/ https://github.com/ddnet/ddnet"
SRC_URI="https://ddnet.tw/downloads/${P}-linux_x86_64.tar.xz -> ${P}.tar.xz"

LICENSE="CC-BY-SA-3.0"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="strip"

RDEPEND="
	dev-libs/glib
	media-libs/freetype
	media-libs/libglvnd
	media-libs/libsdl2
	media-libs/vulkan-loader
	net-misc/curl
	x11-libs/gdk-pixbuf
	x11-libs/libnotify
"

S="${WORKDIR}"

MY_PN="${P}-linux_x86_64"

QA_PREBUILT="
	${MY_PN}/config_retrieve
	${MY_PN}/config_store
	${MY_PN}/DDNet
	${MY_PN}/DDNet-Server
	${MY_PN}/dilate
	${MY_PN}/map_convert_07
	${MY_PN}/map_diff
	${MY_PN}/map_extract
"

src_install(){
	insinto /opt
	doins -r ${MY_PN}

	make_desktop_entry \
		/opt/${MY_PN}/${PN} \   # exec
		${PN} \   # name
		/opt/${MY_PN}/data/gui_logo.png \   # icon
		Game   # category

	local f
	for f in ${QA_PREBUILT}; do
		fperms +x "/opt/${f}"
	done
}

pkg_postinst(){
	ewarn "To support fcitx pinyin input, please recompile your libsdl2 with fcitx enabled."
}
