OLAD_VERSION = 0.10.8
OLAD_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLAD_VERSION)
OLAD_SOURCE = ola-$(OLAD_VERSION).tar.gz

OLAD_DEPENDENCIES = protobuf libmicrohttpd

OLAD_CONF_OPTS = --disable-fatal-warnings

# --- FIX: Overwrite protoc version number to bypass broken protoc version check
OLAD_CONF_ENV += PROTOC_VERSION=2.3.0

# --- FIX: Disable broken protoc version check ---
define OLAD_FIX_PROTOC_VERSION
    $(SED) 's/expr $$PROTOC_VERSION/echo 0/' $(@D)/configure
endef

OLAD_POST_PATCH_HOOKS += OLAD_FIX_PROTOC_VERSION

$(eval $(autotools-package))
