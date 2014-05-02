hetzner-scripts
================

new_machine
-----------
Setup script for adapting a minimal Ubuntu 14.04 installation on a bare metal Hetzner.de server to a configuration with:
- Firewall that allows http, https, 8080 and ssh communication. With protection against bruteforce ssh attacks
- blocked root remote login
- an admin user that can sudo and has publickey ssh authentication

prerequisites:
- You have installed ansible (this is tested on ansible 1.5.5)
- you have installed sshpass
- you have a public ssh key stored in ~/.ssh/id_rsa.pub. This key will be used for access to the admin account


steps:
- provision a new machine at hetzner. Store the password. Hetzner only shows it once, if you navigate away from the page it's gone.
- clone this repository
- copy the hosts.example file to hosts. Adapt the content for your situation (i.e. fill in the desired hostname and admin username)
- __important__ login to new server with ``ssh root@yourserver.com``. This will add your server to known_hosts in ~/.ssh and prevent ansible errors. Please check this is not the rescue instance but a real Ubunt installation.
- logout fromy our server. This will be your last manual login as root on this instance of your server ;-)
- run ``ansible-playbook playbook.yml -i hosts --ask-pass``
- copy and paste the stored password when ansible prompts you
- sit back and watch the show
- when scripts have run, wait a minute or two for the machine finish rebooting
- ssh to the new machine, you should go straight to the prompt
- test if sudo works (e.g. ``sudo df -h``)
- done, have a beer ;-)

ispconfig
---------
setup script for installing ispconfig on a machine. Can be run after new_machine.
