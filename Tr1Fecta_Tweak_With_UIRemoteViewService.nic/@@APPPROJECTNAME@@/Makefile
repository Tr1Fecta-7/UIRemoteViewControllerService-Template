include @@THEOS@@/makefiles/common.mk

APPLICATION_NAME = @@APPPROJECTNAME@@

@@APPPROJECTNAME@@_FILES = $(wildcard *.m)
@@APPPROJECTNAME@@_FRAMEWORKS = UIKit CoreGraphics
@@APPPROJECTNAME@@_CFLAGS = -fobjc-arc
@@APPPROJECTNAME@@_CODESIGN_FLAGS = -Sentitlements.xml

include $(THEOS_MAKE_PATH)/application.mk
