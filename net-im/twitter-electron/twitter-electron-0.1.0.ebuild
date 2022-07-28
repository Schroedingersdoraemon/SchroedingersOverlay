# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="${P}.tar"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PREBUILT="
twitter-electron/swiftshader/libEGL.so
twitter-electron/swiftshader/libGLESv2.so
twitter-electron/chrome-sandbox
twitter-electron/chrome_crashpad_handler
twitter-electron/libEGL.so
twitter-electron/libffmpeg.so
twitter-electron/libGLESv2.so
twitter-electron/libvk_swiftshader.so
twitter-electron/libvulkan.so.1
twitter-electron/twitter-electron
"

S="${WORKDIR}"

src_install(){
	insinto /opt
	doins -r ${PN}
	local f
	for f in ${QA_PREBUILT}; do
		fperms +x "/opt/${f}"
	done
	dosym ../../opt/${PN}/${PN} /usr/bin/${PN}
}
