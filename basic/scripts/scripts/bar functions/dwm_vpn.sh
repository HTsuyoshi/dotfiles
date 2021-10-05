!/bin/sh

# A dwm_bar function to show VPN connections with OpenVPN or WireGuard (if any are active)
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: NetworkManager, NetworkManager-openvpn (for OpenVPN connections)

dwm_vpn () {
    VPN=$(nmcli -a | grep '10.2.16.237' | cut -c 8-18)

    printf "%s" "$SEP1"
    if [ "$VPN" = "10.2.16.237" ]; then
            printf " THM %s" "$VPN" 
        else
            printf " %s" "No VPN"
    fi
}


dwm_vpn
