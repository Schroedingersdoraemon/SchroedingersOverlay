# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg

DESCRIPTION="DDraceNetwork, a cooperative racing mod of Teeworlds "
HOMEPAGE="https://ddnet.tw/
	https://github.com/ddnet/ddnet"
SRC_URI="https://github.com/ddnet/ddnet/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="CC-BY-SA-3.0 OFL-1.1 BSD"
SLOT="0"
IUSE="websockets mysql autoupdate +inform-update +videorecorder upnp antibot headless-client +client +server +tools download-gtest steam discord discord-dynamic prefer-bundled-libs vulkan"
KEYWORDS="~amd64"

DEPEND="
	mysql? ( dev-db/mariadb ) || ( dev-db/sqlite )
	client? (
		net-misc/curl
		media-libs/freetype
		media-libs/libsdl2
		media-libs/libogg
		media-libs/opus
		media-libs/opusfile
		videorecorder? ( media-video/ffmpeg )
	)
	download-gtest? ( dev-cpp/gtest )
	vulkan? (
		media-libs/vulkan-loader
		media-libs/libsdl2[vulkan]
	)
	dev-libs/glib
	media-libs/libglvnd
	x11-libs/gdk-pixbuf
	x11-libs/libnotify
"
RDEPEND="${DEPEND}"
BDEPEND="
	websockets? ( net-libs/libwebsockets )
	server? (
		upnp? ( net-libs/miniupnpc )
	)
	dev-util/cmake
	dev-util/glslang
	dev-util/spirv-tools
	media-sound/wavpack
	media-libs/libpng
	media-libs/opusfile
	media-libs/pnglite
	media-libs/glew
	media-libs/x264
	media-video/ffmpeg
"

src_configure(){
	local mycmakeargs=(
		-DWEBSOCKETS=$(usex websockets ON OFF)
		-DMYSQL=$(usex mysql ON OFF)
		-DAUTOUPDATE=$(usex autoupdate ON OFF)
		-DINFORM_UPDATE=$(usex inform-update ON OFF)
		-DVIDEORECORDER=$(usex videorecorder ON OFF)
		-DUPNP=$(usex upnp ON OFF)
		-DANTIBOT=$(usex antibot ON OFF)
		-DHEADLESS_CLIENT=$(usex headless-client ON OFF)
		-DCLIENT=$(usex client ON OFF)
		-DSERVER=$(usex server ON OFF)
		-DTOOLS=$(usex tools ON OFF)
		-DDOWNLOAD_GTEST=$(usex download-gtest ON OFF)
		-DSTEAM=$(usex steam ON OFF)
		-DDISCORD=$(usex discord ON OFF)
		-DDISCORD_DYNAMIC=$(usex discord-dynamic ON OFF)
		-DPREFER_BUNDLED_LIBS=$(usex prefer-bundled-libs ON OFF)
		-DVULKAN=$(usex vulkan ON OFF)
	)
	cmake_src_configure
}
