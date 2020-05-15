#!/bin/bash
#create the vm
#VBoxManage createvm --name [MACHINE NAME] --ostype [Os Type, ex: "Debian_64"] --register --basefolder `pwd`
##########
# set network configs
#VBoxManage modifyvm [MACHINE NAME] --ioapic on
#VBoxManage modifyvm [MACHINE NAME] --memory 1024 --vram 128
#VBoxManage modifyvm [MACHINE NAME] --nic1 nat
###########
# set disk and connect iso
#VBoxManage createhd --filename `pwd`/[MACHINENAME]/[MACHINE NAME]_DISK.vdi --size 80000 --format VDI
#VBoxManage storagectl [MACHINE NAME] --name "SATA Controller" --add sata --controller IntelAhci
#VBoxManage storageattach [MACHINE NAME] --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium  `pwd`/[MACHINE NAME]/[MACHINE NAME]_DISK.vdi
#VBoxManage storagectl [MACHINE NAME] --name "IDE Controller" --add ide --controller PIIX4
#VBoxManage storageattach [MACHINE NAME] --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium `pwd`/debian.iso
#VBoxManage modifyvm [MACHINE NAME] --boot1 dvd --boot2 disk --boot3 none --boot4 none




#!/bin/bash
MACHINENAME=ubuntu16

# Download ubuntu.iso
if [ ! -f ./ubuntu.iso ]; then
    wget https://releases.ubuntu.com/16.04/ubuntu-16.04.6-desktop-amd64.iso -O ubuntu.iso
fi

#Create VM
VBoxManage createvm --name $MACHINENAME --ostype "Ubuntu_64" --register --basefolder `pwd`
#Set memory and network
VBoxManage modifyvm $MACHINENAME --ioapic on
VBoxManage modifyvm $MACHINENAME --memory 1024 --vram 128
VBoxManage modifyvm $MACHINENAME --nic1 nat
#Create Disk and connect Debian Iso
VBoxManage createhd --filename `pwd`/$MACHINENAME/$MACHINENAME_DISK.vdi --size 80000 --format VDI
VBoxManage storagectl $MACHINENAME --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach $MACHINENAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium  `pwd`/$MACHINENAME/$MACHINENAME_DISK.vdi
VBoxManage storagectl $MACHINENAME --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach $MACHINENAME --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium `pwd`/ubuntu.iso
VBoxManage modifyvm $MACHINENAME --boot1 dvd --boot2 disk --boot3 none --boot4 none

#Enable RDP
VBoxManage modifyvm $MACHINENAME --vrde on
VBoxManage modifyvm $MACHINENAME --vrdemulticon on --vrdeport 10001
VBoxManage modifyvm myserver --natpf1 "ssh,tcp,,3022,,22"
#Start the VM
VBoxHeadless --startvm $MACHINENAME
