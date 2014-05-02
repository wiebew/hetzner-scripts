hetzner-scripts
================

new_machine
-----------
Setup script for adapting a minimal Ubuntu 14.04 installation on a bare metal Hetzner.de server with:
- Firewall that allows http, https, 8080 and ssh communication. With protection against bruteforce ssh attacks
- blocked root remote login
- an admin user with bash shell that can sudo and has publickey ssh authentication

__prerequisites:__
- You have installed ansible (this is tested on ansible 1.5.5)
- you have installed sshpass
- you have a public ssh key stored in ~/.ssh/id_rsa.pub. This key will be used for access to the admin account

__steps:__
- provision a new ubuntu 14.04 LTS Minimal machine at hetzner. __Store the password__. Hetzner only shows it once, if you navigate away from the page it's gone.
- clone this repository
- cd into the folder new_machine
- copy the hosts.example file to hosts. Adapt the content for your situation (i.e. fill in the desired hostname and admin username)
- __IMPORTANT__ login to new server with ``ssh root@yourserver.com``. This will add your server to known_hosts in ~/.ssh and prevent ansible errors. 
- Please check this is not the rescue instance but a real Ubuntu installation. If the prompt shows ``root@rescue`` you are still in rescue mode. In that case logout and login again to verify the Hetzner install is finished. An ubuntu prompt will show something like ``username@Ubuntu-1404-trusty-64-minimal`` 
- logout from your server. This will be your last manual login as root on this instance of your server.
- run ``ansible-playbook playbook.yml -i hosts --ask-pass``
- copy and paste the stored password when ansible prompts you
- sit back and watch the show
- when scripts have run, wait a minute or two for the machine to finish rebooting
- ssh to the new machine, you should go straight to the prompt
- test if sudo works (e.g. ``sudo df -h``)
- done, have a beer ;-)

ispconfig
---------
setup script for installing ispconfig on a machine. Can be run after new_machine.
