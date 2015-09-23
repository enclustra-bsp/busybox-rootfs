################################################################################
#
# fakeroot
#
################################################################################

FAKEROOT_VERSION = 1.18.4
FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
FAKEROOT_SITE = $(BR2_ENCLUSTRA_SITE)
FAKEROOT_LICENSE = GPLv3+
FAKEROOT_LICENSE_FILES = COPYING

$(eval $(host-autotools-package))
