TARGET = :clang::5.0
ARCHS = armv7 arm64

include theos/makefiles/common.mk

TWEAK_NAME = NCPad
NCPad_FILES = Tweak.xm
NCPad_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec spring
