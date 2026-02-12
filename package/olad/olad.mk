OLAD_VERSION = 0.10.8
OLAD_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLAD_VERSION)
OLAD_SOURCE = ola-$(OLAD_VERSION).tar.gz

OLAD_DEPENDENCIES = protobuf libmicrohttpd

OLAD_CONF_OPTS = --disable-fatal-warnings
OLAD_CONF_OPTS += --without-ola-protoc-plugin
OLAD_CONF_OPTS += --disable-examples

define OLAD_COPY_MISSING_RPC_FILES
    cp $(OLAD_PKGDIR)/files/common/rpc/TestService.pb.* $(@D)/common/rpc/
endef

OLAD_POST_PATCH_HOOKS += OLAD_COPY_MISSING_RPC_FILES

OLAD_AUTORECONF = YES

$(eval $(autotools-package))
