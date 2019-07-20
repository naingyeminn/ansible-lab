#!/bin/bash

# Server FQDN
SERVER=gitlab.linuxlab.lan

# Add Repository for Ansible Tower CLI
sudo bash -c 'cat >> /etc/yum.repos.d/tower-cli.repo' << EOF
[tower-cli]
baseurl = https://releases.ansible.com/ansible-tower-cli/rpm/epel-7-x86_64/
sslverify = 0
name = Ansible Tower-cli
enabled = 1
gpgcheck = 0
EOF

# GitLab Installation
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash
sudo EXTERNAL_URL="https://$SERVER" yum install -y gitlab-ee

# Ansible Tower CLI and GitLab Runner Installation
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | sudo bash
sudo yum install ansible-tower-cli gitlab-runner -y

# Configuration for Self-signed TLS Certificates
CERTIFICATE=/etc/gitlab-runner/certs/${SERVER}.crt
sudo mkdir -p $(dirname "$CERTIFICATE")
openssl s_client -connect ${SERVER}:443 -showcerts </dev/null 2>/dev/null | sed -e '/-----BEGIN/,/-----END/!d' | sudo tee "$CERTIFICATE" >/dev/null
sudo runuser -l gitlab-runner -c 'git config --global http.sslVerify false'
