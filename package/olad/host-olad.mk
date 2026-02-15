HOST_OLAD_VERSION = $(OLAD_VERSION)
HOST_OLAD_SOURCE = $(OLAD_SOURCE)
HOST_OLAD_SITE = $(OLAD_SITE)

HOST_OLAD_DEPENDENCIES = host-protobuf
HOST_OLAD_AUTORECONF = YES

HOST_OLAD_CONF_OPTS = \
	--disable-shared \
	--enable-static \
	--without-ola-protoc-plugin

$(eval $(host-autotools-package))
