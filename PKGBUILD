# $Id$
# Maintainer: Michael Sasser <Michael@MichaelSasser.de>

pkgname=aircrack-rtl8814au-dkms-git
_pkgbase=rtl8812au
pkgver=r321.ccea00c
pkgrel=1
pkgdesc="RTL8814AU and chipset driver with firmware v5.1.5"
arch=('i686' 'x86_64')
url="https://github.com/aircrack-ng/rtl8812au"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git' 'dkms' 'bc')
conflicts=()
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
    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}

