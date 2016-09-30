# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A low-level counterpart to Lua"
HOMEPAGE="http://terralang.org/"
LUAJIT="LuaJIT-2.0.4.tar.gz"
SRC_URI="https://github.com/zdevito/terra/archive/release-${PV//./-}.tar.gz -> ${P}.tar.gz
	http://luajit.org/download/${LUAJIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND="sys-devel/clang
	dev-lang/luajit:2"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack "${P}.tar.gz"
	mv "${PN}"-* "${S}" || die
	ln -s "${DISTDIR}/${LUAJIT}" "${S}/build" || die
}

src_install() {
	cd release || die
	dobin terra
	dolib.so libterra.so
	dodoc README.md
	cd include || die
	doheader terra.h *.t
}