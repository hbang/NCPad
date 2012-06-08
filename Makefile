include theos/makefiles/common.mk

TWEAK_NAME = NCPad
NCPad_FILES = Tweak.xm
NCPad_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/tweak.mk
