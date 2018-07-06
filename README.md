manta-lineage-15.1

See also:
https://github.com/dilbrent/android-manifests/tree/manta-lineage-15.1
https://github.com/dilbrent/android-LineageOS


re: https://github.com/openxc/android-webcam

Custom Kernel

If your Android version and device doesn't have include V4L2 support, you'll need to load a custom Android ROM and configure the kernel with these options:

CONFIG_VIDEO_DEV=y
CONFIG_VIDEO_V4L2_COMMON=y
CONFIG_VIDEO_MEDIA=y
CONFIG_USB_VIDEO_CLASS=y
CONFIG_V4L_USB_DRIVERS=y
CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=y
