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
block=/dev/block/platform/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;

write_boot;
## end install

