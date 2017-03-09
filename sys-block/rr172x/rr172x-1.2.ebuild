# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils linux-mod

MY_P=rr172x-linux-src-v${PV}-091106-1524
DESCRIPTION="Kernel Module for the HighPoint RocketRaid 172x RAID Adapter"
HOMEPAGE="http://www.highpoint-tech.com"
SRC_URI="http://www.highpoint-tech.com/BIOS_Driver/rr172x/Linux/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=""

S=${WORKDIR}
MY_S="${WORKDIR}/rr172x-linux-src-v1.2"

BUILD_TARGETS=""
BUILD_TARGET_ARCH="${ARCH}"
MODULE_NAMES="rr172x(block:${MY_S}/product/rr1720/linux:${MY_S}/product/rr1720/linux)"

src_unpack() {
	unpack ${A}
	linux-mod_pkg_setup
	BUILD_PARMS="KERN_DIR=${KV_DIR} KERNOUT=${KV_OUT_DIR}"
}

src_prepare() {
	cd "${MY_S}"
	epatch "${FILESDIR}"/rr172x-kernel-4-x.patch
}

src_compile() {
	cd ${MY_S}/product/rr1720/linux
	emake || die
}

src_install() {
	linux-mod_src_install
}

pkg_postinst() {
	linux-mod_pkg_postinst
	elog "Please add \"rr172x\" to:"
	elog "/etc/conf.d/modules"
}
