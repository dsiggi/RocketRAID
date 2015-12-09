# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils linux-mod

MY_P=rr62x-linux-src-v${PV}-120601-1355
DESCRIPTION="Kernel Module for the HighPoint RocketRaid 62x RAID Adapter"
HOMEPAGE="http://www.highpoint-tech.com"
SRC_URI="http://www.highpoint-tech.com/BIOS_Driver/rr62x/linux/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="app-text/dos2unix"

S=${WORKDIR}
MY_S="${S}/rr62x-linux-src-v1.2"

BUILD_TARGETS=""
BUILD_TARGET_ARCH="${ARCH}"
MODULE_NAMES="rr62x(block:${MY_S}/product/rr62x/linux:${MY_S}/product/rr62x/linux)"

src_unpack() {
	unpack ${A}
	cd "${MY_S}"
	dos2unix -ascii inc/linux/Makefile.def
	epatch "${FILESDIR}"/rr62x-linux-src-v1.2-kernel-3.11.patch
	linux-mod_pkg_setup
	BUILD_PARMS="KERN_DIR=${KV_DIR} KERNOUT=${KV_OUT_DIR}"
}

src_compile() {
	cd ${MY_S}/product/rr62x/linux
	sed -i 's/(" __DATE__ " " __TIME__ ")/ /' config.c
        sed -i "s/v1.10/v1.10 $(date +%Y%m%d) $(date +%H%M%S)/" config.c
	emake || die
}

src_install() {
	linux-mod_src_install
}

pkg_postinst() {
	linux-mod_pkg_postinst
	elog "Please add \"rr62x\" to:"
	elog "/etc/conf.d/modules"
}
