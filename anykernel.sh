# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Luuvy kernel from Zamrud Khatulistiwa
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=santoni
device.name2=Redmi 4x
supported.versions=9, 9.0, 8.1, 8
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
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;
mount -o remount,rw /;
mount -o remount,rw /vendor;
mount -o remount,rw /system;
mount -o remount,rw /sbin;
mount -o remount,rw /data;
mount -o remount,rw /storage;

## AnyKernel install
dump_boot;

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

#Spectrum========================================
cp -rpf $ramdisk/init.spectrum.rc /system/vendor/etc/init/init.spectrum.rc
chmod 644 /system/vendor/etc/init/init.spectrum.rc
cp -rpf $ramdisk/init.spectrum.sh /system/vendor/etc/init/init.spectrum.sh
chmod 644 /system/vendor/etc/init/init.spectrum.sh
#spectrum write init.rc only##############################
if [ -e init.rc ]; then
	cp -rpf init.rc~ init.rc
		####for init.qcom.rc
		remove_line /system/vendor/etc/init/hw/init.qcom.rc "import /init.spectrum.rc";
		remove_line /system/vendor/etc/init/hw/init.qcom.rc "import /vendor/etc/init/hw/init.spectrum.rc";
		remove_line /system/vendor/etc/init/hw/init.qcom.rc "import /vendor/etc/init/init.spectrum.rc";
		remove_line /system/vendor/etc/init/hw/init.qcom.rc "import /system/etc/init/init.spectrum.rc";
		backup_file /system/vendor/etc/init/hw/init.qcom.rc;
		#for init.rc
		remove_line init.rc "import /init.spectrum.rc";
		remove_line init.rc "import /vendor/etc/init/hw/init.spectrum.rc";
		remove_line init.rc "import /vendor/etc/init/init.spectrum.rc";
		remove_line init.rc "import /system/etc/init/init.spectrum.rc";
		backup_file init.rc;
		insert_line init.rc "init.spectrum.rc" before "import /init.usb.rc" "import /vendor/etc/init/init.spectrum.rc";
	else
		if [ -e /system/vendor/etc/init/hw/init.qcom.rc ]; then
			cp -rpf /system/vendor/etc/init/hw/init.qcom.rc~  /system/vendor/etc/init/hw/init.qcom.rc
				remove_line /system/vendor/etc/init/hw/init.qcom.rc "import /init.spectrum.rc";
				remove_line /system/vendor/etc/init/hw/init.qcom.rc "import /vendor/etc/init/hw/init.spectrum.rc";
				remove_line /system/vendor/etc/init/hw/init.qcom.rc "import /vendor/etc/init/init.spectrum.rc";
				remove_line /system/vendor/etc/init/hw/init.qcom.rc "import /system/etc/init/init.spectrum.rc";
				backup_file /system/vendor/etc/init/hw/init.qcom.rc;
				insert_line /system/vendor/etc/init/hw/init.qcom.rc "init.spectrum.rc" before "import /vendor/etc/init/hw/init.qcom.usb.rc" "import /vendor/etc/init/init.spectrum.rc";
		fi;
fi;
#Spectrum========================================

#remove other file spectrum if any
rm -rf /system/vendor/etc/init/hw/init.spectrum.rc
rm -rf /system/vendor/etc/init/hw/init.spectrum.sh
rm -rf /system/etc/init/init.spectrum.rc
rm -rf /system/etc/init/init.spectrum.sh
rm -rf /init.spectrum.rc
rm -rf /init.spectrum.sh

write_boot;
## end install

