#!/system/bin/sh
# SPECTRUM KERNEL MANAGER
# Profile initialization script by nathanchance

# If there is kernel name value, we need to set one
if [ "$(cat /proc/version | grep -c Luuvy)" -eq "1" ]; then 
   # Enable Spectrum profile support
   setprop spectrum.support 1
   # Enable Franco Kernel Manager support
	setprop fku.profiles 1
   #Enable Franco Kernel Manager support
   # Add kernel name
   setprop persist.spectrum.kernel Luuvy.S.SS.
   # Set default profiles bridges on first boot
   # Default profile for Spectrum
   setprop persist.spectrum.profile ""   
   setprop persist.spectrum.profile 0
fi;
