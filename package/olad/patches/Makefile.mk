# Programs
#########################
if BUILD_OLA_PROTOC_PLUGIN
# Plugin disabled
noinst_PROGRAMS =

else

# If we're using a different ola_protoc_plugin, we need to provide a rule to
# create this file since the generated service configs depend on it.
protoc/ola_protoc_plugin$(EXEEXT):
	touch protoc/ola_protoc_plugin$(EXEEXT)

endif
