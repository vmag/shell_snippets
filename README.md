Linux: emergency reboot or shutdown

    echo 1 > /proc/sys/kernel/sysrq 
    echo b > /proc/sysrq-trigger

Convert Virtualbox image to QEMU image:

    qemu-img convert -f vdi -O qcow2 Virtualbox.vdi QEMU.qcow
    
 Centos 7 change kernel: 
 
    awk -F\' /^menuentry/{print\$2} /etc/grub2.cfg
    grub2-set-default 1
    grub2-mkconfig -o /boot/grub2/grub.cfg
    shutdown -r now
    
Mount RAMDISK:  

    mount -t tmpfs -o size=512m tmpfs /mnt/ramdisk
    
Create ansible role:  

    ansible-galaxy init <rollename>
    
Install LT kernel from Elrepo:  
    
    rpm -Uvh https://elrepo.org/linux/kernel/el7/x86_64/RPMS/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
    yum --enablerepo=elrepo-kernel install kernel-lt
    
git - overwrite local files:  
    
    git fetch --all
    git reset --hard origin/master

