OLAD_VERSION = 0.10.8
OLAD_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLAD_VERSION)
OLAD_SOURCE = ola-$(OLAD_VERSION).tar.gz

OLAD_DEPENDENCIES = protobuf libmicrohttpd
OLAD_DEPENDENCIES += host-olad

OLAD_CONF_OPTS = --disable-fatal-warnings
#OLAD_CONF_OPTS += --without-ola-protoc-plugin
#OLAD_CONF_OPTS += --disable-examples
#OLAD_CONF_OPTS += --disable-unittests
#OLAD_CONF_OPTS += --disable-cppunit

OLAD_AUTORECONF = YES

define OLAD_FIX_PLUGIN_PATH
	mkdir $(@D)/protoc
	cp $(HOST_DIR)/bin/ola_protoc_plugin $(@D)/protoc/ola_protoc_plugin
endef

OLAD_POST_PATCH_HOOKS += OLAD_FIX_PLUGIN_PATH

$(eval $(autotools-package))

HOST_OLAD_VERSION = $(OLAD_VERSION)
HOST_OLAD_SOURCE = $(OLAD_SOURCE)
HOST_OLAD_SITE = $(OLAD_SITE)

HOST_OLAD_DEPENDENCIES = host-protobuf
#HOST_OLAD_DEPENDENCIES += host-cppunit
HOST_OLAD_AUTORECONF = YES

HOST_OLAD_CONF_OPTS =
#	--disable-shared
#	--enable-static

# Next line commented out since it would allow an option to be used which tells OLAD to run 'yes' as a command
#HOST_OLAD_CONF_OPTS += --with-ola-protoc-plugin
#HOST_OLAD_CONF_OPTS += --disable-unittests
#HOST_OLAD_CONF_OPTS += --disable-cppunit

$(eval $(host-autotools-package))

# COMMENTED FOR NEW VERSION YOU SEE ABOVE THIS

#OLAD_VERSION = 0.10.8
#OLAD_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLAD_VERSION)
#OLAD_SOURCE = ola-$(OLAD_VERSION).tar.gz

#OLAD_DEPENDENCIES = protobuf libmicrohttpd

#OLAD_CONF_OPTS = --disable-fatal-warnings
#OLAD_CONF_OPTS += --without-ola-protoc-plugin
#OLAD_CONF_OPTS += --disable-examples

# The following lines aren't needed anyymore due to change of used protobuf version
#define OLAD_COPY_MISSING_RPC_FILES
#    cp $(OLAD_PKGDIR)/files/common/rpc/TestService.pb.* $(@D)/common/rpc/
#endef

#define OLAD_COPY_MISSING_RPC_FILES
#	cp $(OLAD_PKGDIR)/files/common/rpc/TestService.pb.* $(@D)/common/rpc/
#endef

#define OLAD_COPY_MISSING_RDM_FILES
#	cp $(OLAD_PKGDIR)/files/common/rdm/Pids.pb.* $(@D)/common/rdm/
#endef

#OLAD_POST_PATCH_HOOKS += OLAD_COPY_MISSING_RPC_FILES
#OLAD_POST_PATCH_HOOKS += OLAD_COPY_MISSING_RDM_FILES
#OLAD_POST_PATCH_HOOKS += OLAD_COPY_MISSING_RPC_FILES

#OLAD_AUTORECONF = YES
#HOST_OLAD_DEPENDENCIES = host-protobuf
#HOST_OLAD_CONF_OPTS = --disable-shared --enable-static
#HOST_OLAD_AUTORECONF = YES

#OLAD_CONF_OPTS += --without-ola-protoc-plugin
#HOST_OLAD_CONF_OPTS += --with-ola-protoc-plugin
#define OLAD_FIX_PLUGIN_PATH
#	mkdir -p $(@D)/protoc
#	cp $(HOST_DIR)/bin/ola_protoc_plugin $(@D)/protoc/ola_protoc_plugin
#endef

#OLAD_POST_PATCH_HOOKS += OLAD_FIX_PLUGIN_PATH

#$(eval $(autotools-package))

# VVV In case that target architecture isn't the same as the build process is executed on VVV
# Configure host package

#HOST_OLAD_VERSION = $(OLAD_VERSION)
#HOST_OLAD_SOURCE = $(OLAD_SOURCE)
#HOST_OLAD_SITE = $(OLAD_SITE)

#HOST_OLAD_DEPENDENCIES = host-protobuf
#HOST_OLAD_AUTORECONF = YES

#HOST_OLAD_CONF_OPTS = \
#	--disable-shared \
#	--enable-static \
#	--without-ola-protoc-plugin

#$(eval $(host-autotools-package))

#$(eval $(host-autotools-package))
