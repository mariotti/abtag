#! /bin/sh
#
# Clean
rm Bookmarks.add2bm.sh Bookmarks.bmdb Bookmarks.html Bookmarks.tags
#
python py-chrome-bookmarks.py Bookmarks.chrome Bookmarks.html | \
    sed "s/' /'/" | sed "s/ '/'/g" | sed 's/^#/.\/bm -f .\/Bookmarks.bmdb /' > Bookmarks.add2bm.sh
#
sh ./Bookmarks.add2bm.sh
#
./bm -f Bookmarks.bmdb -t > Bookmarks.tags
echo "search? .. en"
grep '^en' Bookmarks.tags | awk '{print $1;}' | xargs ./bm -f Bookmarks.bmdb -L
#
exit
#
# INFO
#
##########################################################
# bm
[me@localhost proofOC]$ cat ../../libs/bookmark-master/PKGBUILD 
# Maintainer: Cédric Picard <cpicard@openmailbox.org>

pkgname=bm
pkgver=1.6.1
pkgrel=1
pkgdesc="Simple command line browser independant bookmark and tagging utility"
arch=(any)
url="https://github.com/cym13/bookmark"
license=('GPL')
depends=('python>=3'
         'python-docopt'
         'python-msgpack'
         'python-requests'
         'python-setuptools')
source="https://pypi.python.org/packages/source/b/bm/bm-1.6.1.tar.gz"
md5sums=('c8cb61547ecfbe7919bd9f04bc2f9bbe')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
##########################################################
#py-chrome-bookmarks
# Badly changed to produce the shell script
# ...
## Links

This script is [hosted on GitHub](https://github.com/bdesham/py-chrome-bookmarks).
###

