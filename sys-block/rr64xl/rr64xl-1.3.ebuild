# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils linux-mod

MY_P=RR64xl-Linux-Src-v${PV}-130325-0207
DESCRIPTION="Kernel Module for the HighPoint RocketRaid 64xl RAID Adapter"
HOMEPAGE="http://www.highpoint-tech.com"
SRC_URI="http://www.highpoint-tech.com/BIOS_Driver/RR64xL/Linux/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

S=${WORKDIR}
MY_S="${S}/rr64xl-linux-src-v1.3"

BUILD_TARGETS=""
BUILD_TARGET_ARCH="${ARCH}"
MODULE_NAMES="rr64xl(block:${MY_S}/product/rr64xl/linux:${MY_S}/product/rr64xl/linux)"

src_unpack() {
	unpack ${A}
	cd "${MY_S}"
	epatch "${FILESDIR}"/rr64xl-linux-src-v1.3-kernel-3.11.patch
	linux-mod_pkg_setup
	BUILD_PARMS="KERN_DIR=${KV_DIR} KERNOUT=${KV_OUT_DIR}"
}

src_compile() {
	cd ${MY_S}/product/rr64xl/linux
	emake || die
}

src_install() {
	linux-mod_src_install
}

pkg_postinst() {
	linux-mod_pkg_postinst
	elog "Please add \"rr640l\" to:"
	elog "/etc/conf.d/modules"
}
