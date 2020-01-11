# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils linux-mod linux-info

MY_P=RR64xl_Linux_Src_v${PV}_16_09_20
DESCRIPTION="Kernel Module for the HighPoint RocketRaid 64xl RAID Adapter"
HOMEPAGE="http://www.highpoint-tech.com"
SRC_URI="http://www.highpoint-tech.com/BIOS_Driver/RR64xL/Linux/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

S=${WORKDIR}
MY_S=${S}"/rr64xl-linux-src-v"${PV}

BUILD_TARGETS=""
BUILD_TARGET_ARCH="${ARCH}"
MODULE_NAMES="rr64xl(block:${MY_S}/product/rr64xl/linux:${MY_S}/product/rr64xl/linux)"

pkg_setup() {
	#Patched source only works with kernel >=5
	if kernel_is -lt 5; then
		eerror "patched source only works with kernel >=5"
		die
	fi
}

src_unpack() {
	unpack ${A}
	linux-mod_pkg_setup
	BUILD_PARMS="KERN_DIR=${KV_DIR} KERNOUT=${KV_OUT_DIR}"
}

src_prepare() {
	cd ${S}
	epatch "${FILESDIR}"/rr64xl-kernel-5.patch
	eapply_user
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
