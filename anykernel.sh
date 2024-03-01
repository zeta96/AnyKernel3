### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
script="$0"
properties() { '
kernel.string=Luuvy kernel from Zamrud Khatulistiwa
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
do.rem_encryption=0
do.force_encryption=0
device.name1=santoni
device.name2=Redmi 4x
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
## boot files attributes
attributes() {
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
} # end attributes


# boot shell variables
block=auto;
is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

mount -o remount,rw /;
mount -o remount,rw /vendor;
mount -o remount,rw /system;
mount -o remount,rw /system_root;
mount -o remount,rw /sbin;
mount -o remount,rw /data;
mount -o remount,rw /storage;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
dump_boot; # use split_boot to skip ramdisk unpack, e.g. for devices with init_boot ramdisk

## Enable Spectrum Support
ui_print " "
ui_print "Installing Spectrum & FKM support..."

TMPSYSROOT=/system
TMPSYSROOT=/system_root

# Locate init rc path
INIT_FILE1=$TMPSYSROOT/init.rc
INIT_FILE2=$TMPSYSROOT/system/etc/init/hw/init.rc
INIT_FILE3=$TMPSYSROOT/system/vendor/etc/init/hw/init.qcom.rc

# Locate init path
INIT_PATH1=$TMPSYSROOT
INIT_PATH2=$TMPSYSROOT/system/etc/init
INIT_PATH3=$TMPSYSROOT/system/vendor/etc/init
 
# Locate selinux file
SELINUX_FILE1=$TMPSYSROOT/sepolicy
SELINUX_FILE2=$TMPSYSROOT/system/vendor/etc/selinux/precompiled_sepolicy

# Remove old spectrum
if [ -e "$INIT/init.spectrum.rc" ]; then
	rm -rf $INIT/init.spectrum.rc
	rm -rf $INIT/init.spectrum.sh
fi;

if [ -e "$TMPSYSROOT/init.spectrum.rc" ]; then
	rm -rf $TMPSYSROOT/init.spectrum.rc
	rm -rf $TMPSYSROOT/init.spectrum.sh
fi;

# Clean up other kernels' ramdisk files before installing ramdisk
rm -rf /system/vendor/bin/init.spectrum.rc
rm -rf /system/vendor/bin/init.spectrum.sh
rm -rf /system/vendor/bin/hw/init.spectrum.rc
rm -rf /system/vendor/bin/hw/init.spectrum.sh
rm -rf /system/vendor/etc/init/init.spectrum.rc
rm -rf /system/vendor/etc/init/init.spectrum.sh
rm -rf /system/vendor/etc/init/hw/init.spectrum.rc
rm -rf /system/vendor/etc/init/hw/init.spectrum.sh
rm -rf /system/bin/init.spectrum.rc
rm -rf /system/bin/init.spectrum.sh
rm -rf /system/bin/hw/init.spectrum.rc
rm -rf /system/bin/hw/init.spectrum.sh
rm -rf /system/etc/init/init.spectrum.rc
rm -rf /system/etc/init/init.spectrum.sh
rm -rf /system/etc/init/hw/init.spectrum.rc
rm -rf /system/etc/init/hw/init.spectrum.sh
rm -rf /init.spectrum.rc
rm -rf /init.spectrum.sh
rm -rf /init.performance_profiles.rc
rm -rf /sbin/spa
rm -rf /system/storage/emulated/0/Spectrum/profiles/
rm -rf /data/media/0/Spectrum/profiles/
rm -rf /data/media/0/Spectrum/Profiles/
rm -rf /data/media/0/spectrum/
rm -rf /data/media/0/Spectrum/
rm -rf /data/media/0/init.spectrum.rc
rm -rf /data/media/0/init.spectrum.sh
rm -rf /data/media/0/init.performance_profiles.rc
rm -rf /storage/self/primary/init.spectrum.rc
rm -rf /storage/self/primary/init.spectrum.sh
rm -rf /storage/self/primary/init.performance_profiles.rc
rm -rf /storage/self/primary/spectrum/
rm -rf /storage/self/primary/Spectrum/
rm -rf /storage/self/primary/Spectrum/profiles/
rm -rf /storage/self/primary/Spectrum/Profiles/
rm -rf /storage/self/primary/Spectrum/profiles/balance.profile
rm -rf /storage/self/primary/Spectrum/profiles/battery.profile
rm -rf /storage/self/primary/Spectrum/profiles/gaming.profile
rm -rf /storage/self/primary /Spectrum/profiles/performance.profile
rm -rf /storage/emulated/0/init.spectrum.rc
rm -rf /storage/emulated/0/init.spectrum.sh
rm -rf /storage/emulated/0/init.performance_profiles.rc
rm -rf /storage/emulated/0/spectrum/
rm -rf /storage/emulated/0/Spectrum/
rm -rf /storage/emulated/0/Spectrum/profiles/
rm -rf /storage/emulated/0/Spectrum/Profiles/
rm -rf /storage/emulated/0/Spectrum/profiles/balance.profile
rm -rf /storage/emulated/0/Spectrum/profiles/battery.profile
rm -rf /storage/emulated/0/Spectrum/profiles/gaming.profile
rm -rf /storage/emulated/0/Spectrum/profiles/performance.profile

if [ -e "$INIT_FILE1" ]; then
INIT_RC=$INIT_FILE1
ui_print "- found init folder"
ui_print "- found init file"
remove_line $INIT_RC "import /init.spectrum.rc";
remove_line $INIT_RC "import /vendor/etc/init/hw/init.spectrum.rc";
remove_line $INIT_RC "import /vendor/etc/init/init.spectrum.rc";
remove_line $INIT_RC "import /system/vendor/etc/init/hw/init.spectrum.rc";
remove_line $INIT_RC "import /system/vendor/etc/init/init.spectrum.rc";
remove_line $INIT_RC "import /system/etc/init/hw/init.spectrum.rc";
remove_line $INIT_RC "import /system/etc/init/init.spectrum.rc";
backup_file $INIT_RC;
insert_line $INIT_RC "init.spectrum.rc" before "import /init.environ.rc" "import $INIT_PATH2/init.spectrum.rc";
insert_line $INIT_RC "init.spectrum.rc" before "import /init.usb.rc" "import $INIT_PATH2/init.spectrum.rc";
elif [ -e "$INIT_FILE2" ]; then
INIT_RC=$INIT_FILE2
ui_print "- found init folder"
ui_print "- found init file"
remove_line $INIT_RC "import /init.spectrum.rc";
remove_line $INIT_RC "import /vendor/etc/init/hw/init.spectrum.rc";
remove_line $INIT_RC "import /vendor/etc/init/init.spectrum.rc";
remove_line $INIT_RC "import /system/vendor/etc/init/hw/init.spectrum.rc";
remove_line $INIT_RC "import /system/vendor/etc/init/init.spectrum.rc";
remove_line $INIT_RC "import /system/etc/init/hw/init.spectrum.rc";
remove_line $INIT_RC "import /system/etc/init/init.spectrum.rc";
backup_file $INIT_RC;
insert_line $INIT_RC "init.spectrum.rc" before "import /init.environ.rc" "import $INIT_PATH2/init.spectrum.rc";
insert_line $INIT_RC "init.spectrum.rc" before "import /system/etc/init/hw/init.usb.rc" "import $INIT_PATH2/init.spectrum.rc";
elif [ -e "$INIT_FILE3" ]; then
INIT_RC=$INIT_FILE3
ui_print "- found init folder"
ui_print "- found init file"
remove_line $INIT_RC "import /init.spectrum.rc";
remove_line $INIT_RC "import /vendor/etc/init/hw/init.spectrum.rc";
remove_line $INIT_RC "import /vendor/etc/init/init.spectrum.rc";
remove_line $INIT_RC "import /system/vendor/etc/init/hw/init.spectrum.rc";
remove_line $INIT_RC "import /system/vendor/etc/init/init.spectrum.rc";
remove_line $INIT_RC "import /system/etc/init/hw/init.spectrum.rc";
remove_line $INIT_RC "import /system/etc/init/init.spectrum.rc";
backup_file $INIT_RC;
insert_line $INIT_RC "init.spectrum.rc" before "import /vendor/etc/init/hw/init.qcom.usb.rc" "import $INIT_PATH2/init.spectrum.rc";
insert_line $INIT_RC "init.spectrum.rc" before "import /vendor/etc/init/hw/init.extras.rc" "import $INIT_PATH2/init.spectrum.rc";
else
	ui_print "!- cannot find init folder or file location, make sure system is not empty."
fi;


#Spectrum copy
cp -rpf $home/ramdisk/init.spectrum.rc $INIT_PATH2/init.spectrum.rc
chmod 644 $INIT_PATH2/init.spectrum.rc
cp -rpf $home/ramdisk/init.spectrum.sh $INIT_PATH2/init.spectrum.sh
chmod 644 $INIT_PATH2/init.spectrum.sh

# Locate selinux file and fix selinux denials for /init.*  with force init to load the monolithic sepolicy at /
# Method load-split and split sepolicy for treble don't work for now
if [ -e "$SELINUX_FILE1" ]; then
SELINUX=$SELINUX_FILE1
ui_print "- found selinux file"
$home/tools/magiskpolicy --load $SELINUX --save $SELINUX \
"allow init rootfs file execute_no_trans" \
"allow init sysfs_devices_system_cpu file write" \
"allow init sysfs_msms_perf file write" \
"allow init proc file { open read write}" \
"allow init sysfs file { open read write }" \
"allow init sysfs_kgsl lnk_file { open read write}" \
"allow init vendor_configs_file file execute_no_trans" \
"allow init su process transition" \
"allow init su process { siginh rlimitinh }" \
"allow init sysfs_graphics file { open write }" \
"allow thermal-engine shell_exec file { read open execute }" \
"allow thermal-engine shell_exec file execute_no_trans" \
"allow thermal-engine shell_exec file getattr" \
"allow thermal-engine thermal-engine capability { sys_resource sys_ptrace }" \
"allow thermal-engine toolbox_exec file { execute getattr read open }" \
"allow thermal-engine toolbox_exec file execute_no_trans" \
"allow thermal-engine vendor_toolbox_exec file execute_no_trans" \
"allow thermal-engine system_file file execute_no_trans" \
"allow thermal-engine init dir { search getattr }" \
"allow thermal-engine kernel dir { search getattr }" \
"allow thermal-engine kernel file { read open }" \
"allow thermal-engine init file { read open }" \
"allow thermal-engine vendor_init file { read open }" \
"allow vendor_init proc_dirty_ratio file write" \
"allow vendor_init proc_dirty file write" \
"allow vendor_init default_prop file  { read write }" \
"allow init init udp_socket ioctl" \
"allow init init socket read" \
"allow init object_r chr_file ioctl" \
"allow hal_graphics_composer_default hal_graphics_composer_default netlink_kobject_uevent_socket read" \
"allow hal_graphics_composer_default object_r file { read write open }" \
"allow hal_graphics_composer_default sysfs file { read write open }" \
"allow untrusted_app object_r chr_file { ioctl open read write }" \
"allow surfaceflinger object_r chr_file { read write }" \
"allow priv_app object_r chr_file { getattr ioctl open read write }" \
"allow platform_app object_r chr_file { getattr ioctl open read write }" \
"allow untrusted_app vendor_file file { getattr ioctl open read write }" \
"allow system_server vendor_file file { getattr ioctl open read write }" \
"allow toolbox toolbox capability sys_admin" \
"allow toolbox property_socket sock_file write" \
"allow toolbox default_prop property_service set" \
"allow toolbox init unix_stream_socket connectto" \
"allow toolbox init fifo_file { getattr write }"
elif [ -e "$SELINUX_FILE2" ]; then
SELINUX=$SELINUX_FILE2
ui_print "- found selinux file"
$home/tools/magiskpolicy --load $SELINUX --save $SELINUX \
"allow init rootfs file execute_no_trans" \
"allow init sysfs_devices_system_cpu file write" \
"allow init sysfs_msms_perf file write" \
"allow init proc file { open read write}" \
"allow init sysfs file { open read write }" \
"allow init sysfs_kgsl lnk_file { open read write}" \
"allow init vendor_configs_file file execute_no_trans" \
"allow init su process transition" \
"allow init su process { siginh rlimitinh }" \
"allow init sysfs_graphics file { open write }" \
"allow thermal-engine shell_exec file { read open execute }" \
"allow thermal-engine shell_exec file execute_no_trans" \
"allow thermal-engine shell_exec file getattr" \
"allow thermal-engine thermal-engine capability { sys_resource sys_ptrace }" \
"allow thermal-engine toolbox_exec file { execute getattr read open }" \
"allow thermal-engine toolbox_exec file execute_no_trans" \
"allow thermal-engine vendor_toolbox_exec file execute_no_trans" \
"allow thermal-engine system_file file execute_no_trans" \
"allow thermal-engine init dir { search getattr }" \
"allow thermal-engine kernel dir { search getattr }" \
"allow thermal-engine kernel file { read open }" \
"allow thermal-engine init file { read open }" \
"allow thermal-engine vendor_init file { read open }" \
"allow vendor_init proc_dirty_ratio file write" \
"allow vendor_init proc_dirty file write" \
"allow vendor_init default_prop file  { read write }" \
"allow init init udp_socket ioctl" \
"allow init init socket read" \
"allow init object_r chr_file ioctl" \
"allow hal_graphics_composer_default hal_graphics_composer_default netlink_kobject_uevent_socket read" \
"allow hal_graphics_composer_default object_r file { read write open }" \
"allow hal_graphics_composer_default sysfs file { read write open }" \
"allow untrusted_app object_r chr_file { ioctl open read write }" \
"allow surfaceflinger object_r chr_file { read write }" \
"allow priv_app object_r chr_file { getattr ioctl open read write }" \
"allow platform_app object_r chr_file { getattr ioctl open read write }" \
"allow untrusted_app vendor_file file { getattr ioctl open read write }" \
"allow system_server vendor_file file { getattr ioctl open read write }" \
"allow toolbox toolbox capability sys_admin" \
"allow toolbox property_socket sock_file write" \
"allow toolbox default_prop property_service set" \
"allow toolbox init unix_stream_socket connectto" \
"allow toolbox init fifo_file { getattr write }" 
else
	ui_print "!- cannot find selinux file, make sure system is not empty."
fi;
# end selinux 

# check spectrum
if [ -e "$INIT_PATH2/init.spectrum.rc" ]; then
   ui_print "- spectrum/fkm is ok"
else
	ui_print "!- installing spectrum/fkm failed"
fi;
# end check

ui_print " "

write_boot; # use flash_boot to skip ramdisk repack, e.g. for devices with init_boot ramdisk
## end boot install


## init_boot files attributes
#init_boot_attributes() {
#set_perm_recursive 0 0 755 644 $ramdisk/*;
#set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
#} # end attributes

# init_boot shell variables
#block=init_boot;
#is_slot_device=1;
#ramdisk_compression=auto;
#patch_vbmeta_flag=auto;

# reset for init_boot patching
#reset_ak;

# init_boot install
#dump_boot; # unpack ramdisk since it is the new first stage init ramdisk where overlay.d must go

#write_boot;
## end init_boot install


## vendor_kernel_boot shell variables
#block=vendor_kernel_boot;
#is_slot_device=1;
#ramdisk_compression=auto;
#patch_vbmeta_flag=auto;

# reset for vendor_kernel_boot patching
#reset_ak;

# vendor_kernel_boot install
#split_boot; # skip unpack/repack ramdisk, e.g. for dtb on devices with hdr v4 and vendor_kernel_boot

#flash_boot;
## end vendor_kernel_boot install


## vendor_boot files attributes
#vendor_boot_attributes() {
#set_perm_recursive 0 0 755 644 $ramdisk/*;
#set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
#} # end attributes

# vendor_boot shell variables
#block=vendor_boot;
#is_slot_device=1;
#ramdisk_compression=auto;
#patch_vbmeta_flag=auto;

# reset for vendor_boot patching
#reset_ak;

# vendor_boot install
#dump_boot; # use split_boot to skip ramdisk unpack, e.g. for dtb on devices with hdr v4 but no vendor_kernel_boot

#write_boot; # use flash_boot to skip ramdisk repack, e.g. for dtb on devices with hdr v4 but no vendor_kernel_boot
## end vendor_boot install

