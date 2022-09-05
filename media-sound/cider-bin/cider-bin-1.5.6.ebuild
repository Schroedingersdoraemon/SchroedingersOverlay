# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker desktop xdg

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/ciderapp/cider-releases/releases/download/v${PV}/${PN/-bin}_${PV}_amd64.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

QA_PREBUILT="
	opt/Cider/chrome-sandbox
	opt/Cider/chrome_crashpad_handler
	opt/Cider/cider
	opt/Cider/libEGL.so
	opt/Cider/libffmpeg.so
	opt/Cider/libGLESv2.so
	opt/Cider/libvk_swiftshader.so
	opt/Cider/libvulkan.so.1
"

src_install(){
	insinto /opt
	doins -r opt/Cider

	insinto /usr/share
	doins -r usr/share/icons

	local f
	for f in ${QA_PREBUILT}; do
		fperms +x "/${f}"
	done
	domenu usr/share/applications/cider.desktop

	dosym ../../opt/Cider/${PN/-bin} /usr/bin/${PN/-bin}
}
