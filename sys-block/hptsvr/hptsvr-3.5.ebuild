EAPI=5

MY_P=CLI-Linux-${PV}-100701
DESCRIPTION="Linux Server for the HighPoint RocketRaid Adapters"
HOMEPAGE="http://www.highpoint-tech.com"
SRC_URI="http://www.highpoint-tech.com/BIOS_Driver/HRM/Linux/${MY_P}.tgz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"

IUSE="client"
DEPEND="client? ( sys-block/hptraidconf )"

S=${WORKDIR}

src_unpack() {
	unpack ${A}
	cd "${S}/${MY_P}/deb"
	ar x "hptsvr_3.13-7_${ARCH}.deb"
	tar xf data.tar.gz
}

src_compile() {
	true
}

src_install() {
	cp -R ${S}/${MY_P}/deb/usr ${D} || die
	cp -R ${S}/${MY_P}/deb/bin ${D} || die
	cp -R ${S}/${MY_P}/deb/share ${D} || die
	dodir /etc/init.d
	insinto /etc
	newins ${FILESDIR}/hptcfg hptcfg
	insinto /etc/init.d
	newinitd ${FILESDIR}/hptsvr hptsvr
}

pkg_postinst() {
	elog "Insert your RocketRaid module in:"
	elog "/etc/hptcfg"
	elog ""
	elog "Then you can start the hptsvr with:"
	elog "/etc/init.d/hptsvr"
}
