EAPI=5

MY_P=CLI-Linux-${PV}-100701
DESCRIPTION="Linux Client for the HighPoint RocketRaid Adapters"
HOMEPAGE="http://www.highpoint-tech.com"
SRC_URI="http://www.highpoint-tech.com/BIOS_Driver/HRM/Linux/${MY_P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

S=${WORKDIR}

src_unpack() {
	unpack ${A}
	cd "${S}/${MY_P}/deb"
	ar x "hptraidconf_3.5_${ARCH}.deb"
	tar xf data.tar.gz
}

src_compile() {
	true
}

src_install() {
	cp -R ${S}/${MY_P}/deb/usr ${D} || die
}

pkg_postinst() {
	elog "The default user = RAID"
	elog "The default pw = hpt"
}
