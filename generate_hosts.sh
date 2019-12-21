#!/bin/bash

# Update /etc/hosts file
sudo bash -c 'cat >> /etc/hosts' << EOF
192.168.101.10	tower.linuxlab.lan tower
192.168.101.11	gitlab.linuxlab.lan gitlab
192.168.101.21	server01.linuxlab.lan server01
192.168.101.31	dev01.linuxlab.lan dev01
EOF
