# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils linux-mod

MY_P=rr62x-linux-src-v${PV}-120601-1355
DESCRIPTION="Kernel Module for the HighPoint RocketRaid 62x RAID 
Adapter"
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
	linux-mod_pkg_setup
	BUILD_PARMS="KERN_DIR=${KV_DIR} KERNOUT=${KV_OUT_DIR}"
}

src_prepare() {
	cd "${MY_S}"
	epatch "${FILESDIR}"/rr62x-kernel-4-x.patch
	epatch "${FILESDIR}"/missing-device-ID.patch
}

src_compile() {
	cd ${MY_S}/product/rr62x/linux
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
 
