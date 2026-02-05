OLAD_VERSION = 0.10.8
OLAD_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLAD_VERSION)
OLAD_SOURCE = ola-$(OLAD_VERSION).tar.gz

OLAD_DEPENDENCIES = protobuf libmicrohttpd

OLAD_CONF_OPTS = --disable-fatal-warnings

# autoreconf MUSS laufen, damit protoc.m4 → configure eingebaut wird
OLAD_AUTORECONF = YES

$(eval $(autotools-package))
