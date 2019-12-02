# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
script="$0"
properties() { '
kernel.string=Luuvy kernel from Zamrud Khatulistiwa
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
do.f2fs_patch=1
do.rem_encryption=0
do.force_encryption=0
device.name1=santoni
device.name2=Redmi 4x
supported.versions=8 - 10
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. $home/tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
#example ramdisk set_perm_recursive
#set_perm_recursive 0 0 755 644 $ramdisk/*;
#set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
chmod -R 750 $home/ramdisk/*;
chown -R root:root $home/ramdisk*;
mount -o remount,rw /;
mount -o remount,rw /vendor;
mount -o remount,rw /system;
mount -o remount,rw /sbin;
mount -o remount,rw /data;
mount -o remount,rw /storage;

## AnyKernel install
dump_boot;

# fstab.qcom
if [ -e fstab.qcom ]; then
	fstab=fstab.qcom;
elif [ -e /system/vendor/etc/fstab.qcom ]; then
	fstab=/system/vendor/etc/fstab.qcom;
elif [ -e /system/etc/fstab.qcom ]; then
	fstab=/system/etc/fstab.qcom;
fi;

if [ "$(file_getprop $script do.f2fs_patch)" == 1 ]; then
if [ $(mount | grep f2fs | wc -l) -gt "0" ] &&
   [ $(cat $fstab | grep f2fs | wc -l) -eq "0" ]; then
ui_print " "; ui_print "Found fstab: $fstab";
ui_print "- Adding f2fs support to fstab...";

insert_line $fstab "data        f2fs" before "data        ext4" "/dev/block/bootdevice/by-name/userdata     /data        f2fs    nosuid,nodev,noatime,inline_xattr,data_flush      wait,check,encryptable=footer,formattable,length=-16384";
insert_line $fstab "cache        f2fs" after "data        ext4" "/dev/block/bootdevice/by-name/cache     /cache        f2fs    nosuid,nodev,noatime,inline_xattr,flush_merge,data_flush wait,formattable,check";

	if [ $(cat $fstab | grep f2fs | wc -l) -eq "0" ]; then
		ui_print "- Failed to add f2fs support!";
		exit 1;
	fi;
elif [ $(mount | grep f2fs | wc -l) -gt "0" ] &&
     [ $(cat $fstab | grep f2fs | wc -l) -gt "0" ]; then
	ui_print " "; ui_print "Found fstab: $fstab";
	ui_print "- F2FS supported!";
fi;
fi; #f2fs_patch

if [ $(cat $fstab | grep forceencypt | wc -l) -gt "0" ]; then
	ui_print " "; ui_print "Force encryption is enabled";
	if [ "$(file_getprop $script do.rem_encryption)" == 0 ]; then
		ui_print "- Force encryption removal is off!";
	else
		ui_print "- Force encryption removal is on!";
	fi;
elif [ $(cat $fstab | grep encryptable | wc -l) -gt "0" ]; then
	ui_print " "; ui_print "Force encryption is not enabled";
	if [ "$(file_getprop $script do.force_encryption)" == 0 ]; then
		ui_print "- Force encryption is off!";
	else
		ui_print "- Force encryption is on!";
	fi;
fi;

if [ "$(file_getprop $script do.rem_encryption)" == 1 ] &&
   [ $(cat $fstab | grep forceencypt | wc -l) -gt "0" ]; then
	sed -i 's/forceencrypt/encryptable/g' $fstab
	if [ $(cat $fstab | grep forceencrypt | wc -l) -eq "0" ]; then
		ui_print "- Removed force encryption flag!";
	else
		ui_print "- Failed to remove force encryption!";
		exit 1;
	fi;
elif [ "$(file_getprop $script do.force_encryption)" == 1 ] &&
     [ $(cat $fstab | grep encryptable | wc -l) -gt "0" ]; then
	sed -i 's/encryptable/forceencrypt/g' $fstab
	if [ $(cat $fstab | grep encryptable | wc -l) -eq "0" ]; then
		ui_print "- Added force encryption flag!";
	else
		ui_print "- Failed to add force encryption!";
		exit 1;
	fi;
fi;

# Clean up other kernels' ramdisk files before installing ramdisk
rm -rf /system/vendor/etc/init/init.spectrum.rc
rm -rf /system/vendor/etc/init/init.spectrum.sh
rm -rf /system/vendor/etc/init/hw/init.spectrum.rc
rm -rf /system/vendor/etc/init/hw/init.spectrum.sh
rm -rf /system/etc/init/init.spectrum.rc
rm -rf /system/etc/init/init.spectrum.sh
rm -rf /init.spectrum.rc
rm -rf /init.spectrum.sh
rm -rf /init.performance_profiles.rc
rm -rf /sbin/spa
rm -rf /system/storage/emulated/0/Spectrum/profiles/
rm -rf /data/media/0/Spectrum/profiles/
rm -rf /data/media/0/Spectrum/Profiles/
rm -rf /data/media/0/spectrum/
rm -rf /data/media/0/Spectrum/
rm -rf /storage/emulated/0/spectrum/
rm -rf /storage/emulated/0/Spectrum/
rm -rf /storage/emulated/0/Spectrum/profiles/
rm -rf /storage/emulated/0/Spectrum/Profiles/
rm -rf /storage/emulated/0/Spectrum/profiles/balance.profile
rm -rf /storage/emulated/0/Spectrum/profiles/battery.profile
rm -rf /storage/emulated/0/Spectrum/profiles/gaming.profile
rm -rf /storage/emulated/0/Spectrum/profiles/performance.profile


#remove other file spectrum if any
rm -rf /system/vendor/etc/init/hw/init.spectrum.rc
rm -rf /system/vendor/etc/init/hw/init.spectrum.sh
rm -rf /system/etc/init/init.spectrum.rc
rm -rf /system/etc/init/init.spectrum.sh
rm -rf /init.spectrum.rc
rm -rf /init.spectrum.sh

# end ramdisk changes

write_boot;
## end install
