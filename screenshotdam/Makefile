export THEOS_DEVICE_IP=evans-iphone-4.local
export ARCHS = armv7

include theos/makefiles/common.mk

TWEAK_NAME = ScreenshotDam
ScreenshotDam_FILES = Tweak.xm
ScreenshotDam_FRAMEWORKS = AssetsLibrary
KILL_APP = SpringBoard

include $(THEOS_MAKE_PATH)/tweak.mk
