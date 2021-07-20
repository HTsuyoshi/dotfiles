!/bin/sh

# A dwm_bar function to show VPN connections with OpenVPN or WireGuard (if any are active)
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: NetworkManager, NetworkManager-openvpn (for OpenVPN connections)

dwm_vpn () {
    THM=$(nmcli -a | grep '10.2.16.237' | cut -c 8-18)
    HTB=$(nmcli -a | grep '10.10.15.7' | cut -c 8-17 | uniq)

    printf "%s" "$SEP1"
    if [ "$THM" = "10.2.16.237" ]; then
                printf " 說 THM %s" "$THM " 
        else if [ "$HTB" = "10.10.15.7" ]; then
                printf " 說 HTB %s" "$HTB " 
            else
            printf " %s " "No VPN"
        fi
    fi
}


dwm_vpn
