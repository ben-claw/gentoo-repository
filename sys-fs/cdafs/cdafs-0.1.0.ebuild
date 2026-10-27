# Copyright 2026 Ben Claw
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="CD Audio Filesystem"
HOMEPAGE="https://github.com/ben-claw/cdafs"
SRC_URI="https://github.com/ben-claw/cdafs/releases/download/v${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

inherit autotools

IUSE="debug"

BDEPEND="
	virtual/pkgconfig
"

RDEPEND="
	>=sys-fs/fuse-2.6:0
"

DEPEND="${RDEPEND}"

src_configure() {
	econf $(use_enable debug)
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install

	#dodoc README.md README_RU.md
}
