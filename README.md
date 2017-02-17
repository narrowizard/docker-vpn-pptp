# VPN (PPTP) for Docker

This is a docker image with simple VPN (PPTP) server.

This container will write a _/etc/ppp/chap-secrets_ file based on the following env
variables which must be set:
$client
$server
$secret
$acceptable_local_ip_addresses

## Starting VPN server

To start VPN server as a docker container run:

````
docker run -ti --net=host --privileged -p 1723:1723 -e client=some_user -e server=* -e secret=password -e acceptable_local_ip_addresses=* mmontagna/docker-vpn-pptp
````

Based on:
https://github.com/mobtitude/docker-vpn-pptp
