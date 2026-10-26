# Copyright 2026
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

MY_PN="aquilum-app"

DESCRIPTION="Fast local-first Markdown knowledge base"
HOMEPAGE="https://github.com/Freaction/Aquilum/"
SRC_URI="https://github.com/Freaction/Aquilum/releases/download/v${PV}/Aquilum_${PV}_amd64.deb"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

S="${WORKDIR}"

RDEPEND="
	dev-libs/glib
	media-libs/fontconfig
	media-libs/freetype
	media-libs/gstreamer
	media-libs/gst-plugins-base
	media-libs/gst-plugins-good
	x11-libs/libX11
	x11-libs/libXcursor
	x11-libs/libXrandr
	x11-libs/libXi
	x11-libs/libxcb
	x11-libs/libxkbcommon
	dev-libs/wayland
	|| (
		sys-apps/xdg-desktop-portal
		gnome-extra/zenity
	)
	!app-office/aquilum
"

src_install() {
	dobin "${WORKDIR}"/usr/bin/aquilum-app
	domenu "${WORKDIR}"/usr/share/applications/Aquilum.desktop
	for size in 32 128 256 ; do
		doicon --size ${size} usr/share/icons/hicolor/${size}x${size}/apps/${MY_PN}.png
	done
}
