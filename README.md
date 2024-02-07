# Minecraft Spiggot installer for Linux Server
This Ansible Script installs a minecraft spiggot server on your linux System.

# Requirements
- You have a Debian System (Like Ubuntu) as host for your minecraft server
- There is a user "ansible" present with its home under (home/ansible)
- This user has sudo privileges and does not need a password to use them.
  Example entry in sudoers file: ansible ALL=(ALL:ALL) NOPASSWD: ALL

# Security Recomendation
- Authenticating as user "ansible" is possible over public-private keypair. The private key is generated on the system from where you want to connect to our minecraft host server.
  The corresponding public key is stored in the file /home/ansible/.ssh/authorized_keys of your minecraft host server.
- The user "ansible" has a locked password ($ passwd -l ansible). Authentication over a password will not work even when you try it from the hosts terminal
  
