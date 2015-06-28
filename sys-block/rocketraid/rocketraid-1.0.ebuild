EAPI=5

DESCRIPTION="Meta package for the kernel modules for the HighPoint RocketRaid Adapters"
HOMEPAGE="http://www.highpoint-tech.com"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="amd64 x86"

IUSE="rr172x rr174x rr2210 rr222x rr2240 rr231x rr232x rr2340 rr2522 rr2644 rr264x rr268x rr62x rr64x rr64xl"

PDEPEND="rr172x? ( sys-block/rr172x )
rr174x? ( sys-block/rr174x )
rr2210? ( sys-block/rr2210 )
rr222x? ( sys-block/rr222x )
rr2240? ( sys-block/rr2240 )
rr231x? ( sys-block/rr231x )
rr232x? ( sys-block/rr232x )
rr2340? ( sys-block/rr2340 )
rr2522? ( sys-block/rr2522 )
rr2644? ( sys-block/rr2644 )
rr264x? ( sys-block/rr264x )
rr268x? ( sys-block/rr268x )
rr62x? ( sys-block/rr62x )
rr64x? ( sys-block/rr64x )
rr64xl? ( sys-block/rr64xl )"
