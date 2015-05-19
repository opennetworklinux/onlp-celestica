###############################################################################
#
# x86_64_cel_redstone_xp Unit Test Makefile.
#
###############################################################################
UMODULE := x86_64_cel_redstone_xp
UMODULE_SUBDIR := $(dir $(lastword $(MAKEFILE_LIST)))
include $(BUILDER)/utest.mk
