# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker desktop

DESCRIPTION="致力于打造macOS和Linux桌面下最好用的微信（wechat）客户端"
HOMEPAGE="https://github.com/eNkru/freechat"
SRC_URI="https://github.com/eNkru/${PN}/releases/download/v1.0.0/electron-wechat_1.0.0_amd64.deb -> ${P}.deb"

LICENSE=""
SLOT="0"
RESTRICT="strip"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install(){
	insinto /opt
	doins -r opt/*
	fperms +x /opt/Freechat/{electron-wechat,chrome-sandbox,libEGL.so,libffmpeg.so,libGLESv2.so}
	fperms +x /opt/Freechat/swiftshader/{libEGL.so,libGLESv2.so}
	for is in 16 32 48 64 128 256 512; do
		doicon -s ${is} usr/share/icons/hicolor/${is}x${is}/apps/electron-wechat.png
	done
	domenu usr/share/applications/electron-wechat.desktop
}
