ARCHS = arm64 arm64e

include @@THEOS@@/makefiles/common.mk

TWEAK_NAME = @@PROJECTNAME@@

@@PROJECTNAME@@_FILES = Tweak.xm
@@PROJECTNAME@@_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += @@APPPROJECTNAME@@

include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall @@APPPROJECTNAME@@; sbreload"
	