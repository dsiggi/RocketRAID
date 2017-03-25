# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils linux-mod

MY_P=RR264x-Linux-Src-v${PV}-120817-1641
DESCRIPTION="Kernel Module for the HighPoint RocketRaid 264x RAID Adapter"
HOMEPAGE="http://www.highpoint-tech.com"
SRC_URI="http://www.highpoint-tech.com/BIOS_Driver/rr26xx/2640X1-2640X4-2642/Linux/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=""

S=${WORKDIR}
MY_S="${S}/rr264x-linux-src-v1.5"

BUILD_TARGETS=""
BUILD_TARGET_ARCH="${ARCH}"
MODULE_NAMES="rr26xx(block:${MY_S}/product/rr2640/linux:${MY_S}/product/rr2640/linux)"

src_unpack() {
	unpack ${A}
	linux-mod_pkg_setup
	BUILD_PARMS="KERN_DIR=${KV_DIR} KERNOUT=${KV_OUT_DIR}"
}

src_prepare() {
	cd "${MY_S}"
	epatch "${FILESDIR}"/rr264x-kernel-4-x.patch
}

src_compile() {
	cd ${MY_S}/product/rr2640/linux
	emake || die
}

src_install() {
	linux-mod_src_install
}

pkg_postinst() {
	linux-mod_pkg_postinst
	elog "Please add \"rr26xx\" to:"
	elog "/etc/conf.d/modules"
}
