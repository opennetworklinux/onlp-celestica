################################################################
# <bsn.cl fy=2013 v=onl>
# </bsn.cl>
################################################################

#
# The root of of our repository is here:
#
ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

#
# Resolve submodule dependencies.
#
ifndef SUBMODULE_INFRA
  ifdef SUBMODULES
    SUBMODULE_INFRA := $(SUBMODULES)/infra
  else
    SUBMODULE_INFRA := $(ROOT)/submodules/infra
  endif
endif

ifndef SUBMODULE_BIGCODE
  ifdef SUBMODULES
    SUBMODULE_BIGCODE := $(SUBMODULES)/bigcode
  else
    SUBMODULE_BIGCODE := $(ROOT)/submodules/bigcode
  endif
endif

ifndef SUBMODULE_ONLP
  ifdef SUBMODULES
    SUBMODULE_ONLP := $(SUBMODULES)/onlp
  else
    SUBMODULE_ONLP := $(ROOT)/submodules/onlp
  endif
endif

export SUBMODULE_INFRA
export BUILDER := $(SUBMODULE_INFRA)/builder/unix

MODULE_DIRS := $(ROOT)/modules $(SUBMODULE_INFRA)/modules $(SUBMODULE_BIGCODE)/modules $(SUBMODULE_ONLP)/modules

.show-submodules:
	@echo infra @ $(SUBMODULE_INFRA)
	@echo bigcode @ $(SUBMODULE_BIGCODE)

#
# These are the subdirectories in the current directory
#
ifdef MAKESUBDIRS
ifndef SUBDIRS
SUBDIRS=$(patsubst %/,%, $(wildcard */))
endif
makesubdirs $(MAKECMDGOALS):
	@$(foreach d,$(SUBDIRS), test ! -f $(d)/Makefile || $(MAKE) -C $(d) $(MAKECMDGOALS) || exit 1;)
endif












