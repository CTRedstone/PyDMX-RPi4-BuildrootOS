PYDMX_VERSION = 0.58
PYDMX_SITE = package/PyDMX/files
PYDMX_SITE_METHOD = local

define PYDMX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/opt/PyDMX
	cp -r $(@D)/* $(TARGET_DIR)/opt/PyDMX
endef

$(eval $(generic-package))
