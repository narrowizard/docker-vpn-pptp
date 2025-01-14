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
iptables -P FORWARD ACCEPT

exec "$@"
