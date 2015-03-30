# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils linux-mod

MY_P=rr232x-linux-src-v${PV}-090716-0928
DESCRIPTION="Kernel Module for the HighPoint RocketRaid 232x RAID Adapter"
HOMEPAGE="http://www.highpoint-tech.com"
SRC_URI="http://www.highpoint-tech.com/BIOS_Driver/rr232x/Linux/new%20format/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

S=${WORKDIR}
MY_S="${S}/rr232x-linux-src-v1.10"

BUILD_TARGETS=""
BUILD_TARGET_ARCH="${ARCH}"
MODULE_NAMES="rr232x(block:${MY_S}/product/rr232x/linux:${MY_S}/product/rr232x/linux)"

src_unpack() {
	unpack ${A}
	cd "${MY_S}"
	epatch "${FILESDIR}"/rr232x-linux-src-v1.10-kernel-3.11.patch
	linux-mod_pkg_setup
	BUILD_PARMS="KERN_DIR=${KV_DIR} KERNOUT=${KV_OUT_DIR}"
}

src_compile() {
	cd ${MY_S}/product/rr232x/linux
	emake || die
	#fperms 444 rr232x.ko
	chmod 444 ${MY_S}/product/rr232x/linux/rr232x.ko
}

src_install() {
	#fperms 444 ${MY_S}/product/rr232x/linux/rr232x.ko
	linux-mod_src_install
}

pkg_postinst() {
	linux-mod_pkg_postinst
	elog "Please add \"rr232x\" to:"
	elog "/etc/conf.d/modules"
}
