#!/bin/sh

vpn_name=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1)
vpn_status=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 2)
tun0_ip=$(ip -o -4 addr show dev tun0 2>/dev/null | awk '{split($4,a,"/"); print a[1]}')

if [ -z "$tun0_ip" ]; then
    printf "%%{F#5FB4DE}VPN %%{F-}󰌊"
else
    printf "%%{F#5FB4DE}${vpn_status} ${vpn_name}%%{F-} ${tun0_ip}"
fi
