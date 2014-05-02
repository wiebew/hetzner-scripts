hetzner-scripts
================

new_machine
-----------
Setup scripts for adapting a bare metal Hetzner.de server to a configuration with:
- Firewall that allows http, https, 8080 and ssh communication. With protection against bruteforce ssh attacks
- blocked root remote login
- an admin user that can sudo and has publickey ssh authentication

usage:
- install ansible on your client
- clone this repository
- provision a new machine at hetzner. Store the password.
- copy the hosts.example file to hosts. Adapt the content for your situation (i.e. hostname and admin username)
- run ``ansible playbook.yml -i hosts``

ispconfig
---------
setup script for installing ispconfig on a machine. Can be run after new_machine.
