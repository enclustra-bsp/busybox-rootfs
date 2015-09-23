################################################################################
#
# mpfr
#
################################################################################

MPFR_VERSION = 3.1.2
MPFR_SITE = $(BR2_ENCLUSTRA_SITE)
MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
MPFR_LICENSE = LGPLv3+
MPFR_LICENSE_FILES = COPYING.LESSER
MPFR_INSTALL_STAGING = YES
MPFR_DEPENDENCIES = gmp
MPFR_MAKE_OPTS = RANLIB=$(TARGET_RANLIB)

$(eval $(autotools-package))
$(eval $(host-autotools-package))
