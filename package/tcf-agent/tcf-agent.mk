################################################################################
#
# TCF_AGENT
#
################################################################################

TCF_AGENT_VERSION = 7844ce1
TCF_AGENT_SITE = ${BR2_BACKUP_SITE}
TCF_AGENT_SOURCE = tcf-agent-${TCF_AGENT_VERSION}.tar.gz

define TCF_AGENT_BUILD_CMDS
	AR=${TARGET_AR} CC=${TARGET_CC} OPSYS=GNU\\/Linux MACHINE=arm CFLAGS='-DENABLE_SSL=0 -DUSE_uuid_generate=0 -DENABLE_arch_armv7l' LIBS='-lpthread -lrt' ${MAKE} -C ${@D}
endef

define TCF_AGENT_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/obj/GNU/Linux/arm/Debug/agent $(TARGET_DIR)/usr/bin/tcf-agent
endef

$(eval $(generic-package))
