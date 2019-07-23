#!/bin/sh

set -e

# enable IP forwarding
sysctl -w net.ipv4.ip_forward=1


# Add a startup script
echo "# Secrets for authentication using PAP
# client    server      secret      acceptable local IP addresses
$client    $server      $password    $acceptable_local_ip_addresses
" > /etc/ppp/chap-secrets


# configure firewall
iptables -A FORWARD -s 10.99.99.0/24 -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j TCPMSS --set-mss 1356
iptables -P FORWARD ACCEPT

exec "$@"
