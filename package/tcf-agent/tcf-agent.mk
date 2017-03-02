################################################################################
#
# TCF_AGENT
#
################################################################################

TCF_AGENT_VERSION = 7844ce1
TCF_AGENT_SITE = ${BR2_BACKUP_SITE}
TCF_AGENT_SOURCE = tcf-agent-${TCF_AGENT_VERSION}.tar.gz

ifeq ($(KERNEL_ARCH),arm64)
TCF_AGENT_ARCH = a64
else
TCF_AGENT_ARCH = $(KERNEL_ARCH)
endif

define TCF_AGENT_BUILD_CMDS
	AR=${TARGET_AR} CC=${TARGET_CC} OPSYS=GNU\\/Linux MACHINE=$(TCF_AGENT_ARCH) CFLAGS='-DENABLE_SSL=0 -DUSE_uuid_generate=0 -DENABLE_arch_armv7l' LIBS='-lpthread -lrt' ${MAKE} -C ${@D}
endef

define TCF_AGENT_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/obj/GNU/Linux/$(TCF_AGENT_ARCH)/Debug/agent $(TARGET_DIR)/usr/bin/tcf-agent
endef

$(eval $(generic-package))
