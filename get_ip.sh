VM_IP=$(ip addr | grep "global dynamic" | awk '{print $2}' | sed 's/\/24//g' )
echo $VM_IP
