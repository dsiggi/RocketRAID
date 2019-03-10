# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils linux-mod

MY_P=rr2340-linux-src-v${PV}-090925-0900
DESCRIPTION="Kernel Module for the HighPoint RocketRaid 2340 RAID Adapter"
HOMEPAGE="http://www.highpoint-tech.com"
SRC_URI="http://www.highpoint-tech.com/BIOS_Driver/rr2340/Linux/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=""

S=${WORKDIR}
MY_S="${S}/rr2340-linux-src-v1.7"

BUILD_TARGETS=""
BUILD_TARGET_ARCH="${ARCH}"
MODULE_NAMES="rr2340(block:${MY_S}/product/rr2340/linux:${MY_S}/product/rr2340/linux)"

src_unpack() {
	unpack ${A}
	linux-mod_pkg_setup
	BUILD_PARMS="KERN_DIR=${KV_DIR} KERNOUT=${KV_OUT_DIR}"
}

src_prepare() {
	cd "${MY_S}"
	epatch "${FILESDIR}"/rr2340-kernel-4-x.patch
	epatch "${FILESDIR}"/rr2340-timer.patch
	eapply_user
}

src_compile() {
	cd ${MY_S}/product/rr2340/linux
	emake || die
}

src_install() {
	linux-mod_src_install
}

pkg_postinst() {
	linux-mod_pkg_postinst
	elog "Please add \"rr2340\" to:"
	elog "/etc/conf.d/modules"
}
