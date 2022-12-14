package main

VIRTIO_BASE :: 0x10001000
VIRTIO_SIZE :: 0x1000
VIRTIO_MAGIC :: (VIRTIO_BASE + 0x000)
VIRTIO_VERSION :: (VIRTIO_BASE + 0x004)
VIRTIO_DEVICE_ID :: (VIRTIO_BASE + 0x008)
VIRTIO_VENDOR_ID :: (VIRTIO_BASE + 0x00c)
VIRTIO_DEVICE_FEATURES :: (VIRTIO_BASE + 0x010)
VIRTIO_DRIVER_FEATURES :: (VIRTIO_BASE + 0x020)
VIRTIO_GUEST_PAGE_SIZE :: (VIRTIO_BASE + 0x028)
VIRTIO_QUEUE_SEL :: (VIRTIO_BASE + 0x030)
VIRTIO_QUEUE_NUM_MAX :: (VIRTIO_BASE + 0x034)
VIRTIO_QUEUE_NUM :: (VIRTIO_BASE + 0x038)
VIRTIO_QUEUE_PFN :: (VIRTIO_BASE + 0x040)
VIRTIO_QUEUE_NOTIFY :: (VIRTIO_BASE + 0x050)
VIRTIO_STATUS :: (VIRTIO_BASE + 0x070)

VIRTIO_VRING_DESC_SIZE :: 16
VIRTIO_DESC_NUM :: 8
