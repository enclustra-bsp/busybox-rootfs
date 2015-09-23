################################################################################
#
# genext2fs
#
################################################################################

GENEXT2FS_VERSION = 1.4.1
GENEXT2FS_SITE = $(BR2_ENCLUSTRA_SITE)
GENEXT2FS_LICENSE = GPLv2
GENEXT2FS_LICENSE_FILES = COPYING

$(eval $(autotools-package))
$(eval $(host-autotools-package))
