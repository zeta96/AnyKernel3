#!/system/bin/sh

# Description=Default Luuvy Kernel profile optimized for a light experience. 
## Author: zeta96
# Luuvy Kernel
#

if [ "$(grep -c Luuvy-Sky /proc/version)" -eq "1" ]; then 
	echo "Apply Luv-Sky1 profile..."  | tee /dev/kmsg &>/dev/null

	sleep 3;

	##CPU
	#max big
	#echo '0:1401000' > /sys/module/msm_performance/parameters/cpu_max_freq
	#echo '1:1401000' > /sys/module/msm_performance/parameters/cpu_max_freq
	#echo '2:1401000' > /sys/module/msm_performance/parameters/cpu_max_freq
	#echo '3:1401000' > /sys/module/msm_performance/parameters/cpu_max_freq

	chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
	echo '1401000' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
	chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq

	#min big
	#echo '0:960000' > /sys/module/msm_performance/parameters/cpu_min_freq
	#echo '1:960000' > /sys/module/msm_performance/parameters/cpu_min_freq
	#echo '2:960000' > /sys/module/msm_performance/parameters/cpu_min_freq
	#echo '3:960000' > /sys/module/msm_performance/parameters/cpu_min_freq

	chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
	echo '960000' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
	chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq

	#governor big
	chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	echo 'interactive' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

	#max little
	#echo '4:1094400' > /sys/module/msm_performance/parameters/cpu_max_freq
	#echo '5:1094400' > /sys/module/msm_performance/parameters/cpu_max_freq
	#echo '6:1094400' > /sys/module/msm_performance/parameters/cpu_max_freq
	#echo '7:1094400' > /sys/module/msm_performance/parameters/cpu_max_freq

	chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
	echo '1094400' > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
	chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq

	#min little
	#echo '4:768000' > /sys/module/msm_performance/parameters/cpu_min_freq
	#echo '5:768000' > /sys/module/msm_performance/parameters/cpu_min_freq
	#echo '6:768000' > /sys/module/msm_performance/parameters/cpu_min_freq
	#echo '7:768000' > /sys/module/msm_performance/parameters/cpu_min_freq

	chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
	echo '768000' > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
	chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq

	#governor little
	chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
	echo 'interactive' > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
	chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor

	#mod
	chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	echo 'interactive' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

	chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
	echo '50000' > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
	chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay

	chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
	echo '95' > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
	chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load

	chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
	echo '1094400' > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
	chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq

	chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
	echo '40000' > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
	chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time

	chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/powersave_bias
	echo '1' > /sys/devices/system/cpu/cpu0/cpufreq/interactive/powersave_bias
	chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/powersave_bias

	chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/screen_off_maxfreq
	echo '960000' > /sys/devices/system/cpu/cpu0/cpufreq/interactive/screen_off_maxfreq
	chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/screen_off_maxfreq

	chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
	echo '90' > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
	chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads

	chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
	echo 'interactive' > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
	chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor

	chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
	echo '100000' > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
	chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate

	chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
	echo '120000' > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
	chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack

	chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif
	echo '1' > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif
	chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif

	chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load
	echo '1' > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load
	chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load

	chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
	echo '50000' > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
	chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay

	chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
	echo '90' > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
	chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load

	chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
	echo '40000' > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
	chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time

	chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/powersave_bias
	echo '1' > /sys/devices/system/cpu/cpu4/cpufreq/interactive/powersave_bias
	chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/interactive/powersave_bias

	chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
	echo '90' > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
	chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads

	chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/screen_off_maxfreq
	echo '960000' > /sys/devices/system/cpu/cpu4/cpufreq/interactive/screen_off_maxfreq
	chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/interactive/screen_off_maxfreq

	chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
	echo '100000' > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
	chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate

	chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
	echo '120000' > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
	chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack

	chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif
	echo '1' > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif
	chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif

	chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load
	echo '1' > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load
	chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load

	chmod 644 /sys/module/workqueue/parameters/power_efficient
	echo 'Y' > /sys/module/workqueue/parameters/power_efficient

	##HOTPLUG
	echo '1' > /sys/kernel/alucard_hotplug/hotplug_enable

	##GPU
	echo '475000000' > /sys/class/kgsl/kgsl-3d0/max_gpuclk
	echo '216' > /sys/class/kgsl/kgsl-3d0/min_clock_mhz
	echo msm-adreno-tz > /sys/class/kgsl/kgsl-3d0/devfreq/governor
	echo '475' > /sys/kernel/gpu/gpu_max_clock
	echo '216' > /sys/kernel/gpu/gpu_min_clock

	##THERMAL
	echo '0' > /sys/module/msm_thermal/core_control/enabled
	echo '0' > /sys/module/msm_thermal/vdd_restriction/enabled
	echo 'N' > /sys/module/msm_thermal/parameters/enabled

	##I/O
	echo 'noop' > /sys/block/mmcblk0/queue/scheduler
	echo '1024' > /sys/block/mmcblk0/queue/read_ahead_kb
	echo '0' > /sys/block/mmcblk0/queue/rotational
	echo '0' > /sys/block/mmcblk0/queue/iostats
	echo '0' > /sys/block/mmcblk0/queue/add_random
	echo '1' > /sys/block/mmcblk0/queue/rq_affinity

	##LKM
	chmod 666 /sys/module/lowmemorykiller/parameters/minfree
	chown root /sys/module/lowmemorykiller/parameters/minfree
	echo '18432,23040,27648,32256,55296,80640' > /sys/module/lowmemorykiller/parameters/minfree

	##VM
	echo '20' > /proc/sys/vm/dirty_ratio
	echo '5' > /proc/sys/vm/dirty_background_ratio
	#echo '200' > /proc/sys/vm/dirty_expire_centisecs
	#echo '500' > /proc/sys/vm/dirty_writeback_centisecs
	echo '60' > /proc/sys/vm/swappiness
	#echo '100' > /proc/sys/vm/vfs_cache_pressure

	##MISC
	#echo 2691 > /sys/class/timed_output/vibrator/vtg_level
	echo 'westwood' > /proc/sys/net/ipv4/tcp_congestion_control

	##The END
	# zeta96
	echo "Everything done..." | tee /dev/kmsg  &>/dev/null
fi
