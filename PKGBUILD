# $Id$
# Maintainer: Michael Sasser <Michael@MichaelSasser.de>

pkgname=aircrack-rtl8814au-dkms-git
_pkgbase=rtl8812au
pkgver=r321.ccea00c
pkgrel=1
pkgdesc="Driver with monitor mode and frame injection for the trl8814au wifi chip"
arch=('i686' 'x86_64')
url="https://github.com/aircrack-ng/rtl8812au"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git' 'dkms' 'bc')
conflicts=('rtl8814au-dkms-git' 'rtl18814au')
source=("git+https://github.com/aircrack-ng/rtl8812au#branch=v5.1.5aircrack-ng/rtl8812au#branch=v5.1.5"
        "dkms.conf")
sha256sums=('SKIP'
            '6179ac71a60c5609a603b226093320db531b32a1d7f3684fbea1392947df01ce')

pkgver() {
    cd "${srcdir}/${_pkgbase}" || exit 1
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgbase}" || exit 1
    mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}

    # Change placeolders in dkms.conf
    sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}

