#
# Copy some scripts into the buildroot and setup to execute them in a chroot
#

cp -a /zfs.d/inchroot /mnt/zfs.d
cp -a /zfs.install /mnt

mount -t devtmpfs none /mnt/dev
mount -t devpts none /mnt/dev/pts
mount -t proc none /mnt/proc
mount -t sysfs none /mnt/sys

chroot /mnt /zfs.install

umount /mnt/dev/pts
umount /mnt/dev
umount /mnt/proc
umount /mnt/sys

rm -f /mnt/zfs.install
rm -rf /mnt/zfs.d
