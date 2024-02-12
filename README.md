# Minecraft Server installer Role for Linux Server
This Ansible Role installs a minecraft server on your linux System and also the apt packages (if not present) 
- screen 
- openjdk-19-jre-headless
- ufw
- vim 

# Supported servertypes:
  - spiggot
  - craftbukkit

# Requirements
- You have a Debian System (Like Ubuntu) as host for your minecraft server
- There is a user "ansible" present with its home under (home/ansible)
- This user has sudo privileges and does not need a password to use them.
  Example entry in sudoers file: ansible ALL=(ALL:ALL) NOPASSWD: ALL
- Requirements to execute the script properly will be checked when executing this ansible playbook.
  If something is missing, it will tell you what is needed to be installed.

# Security Recomendation
- Authenticating as user "ansible" is possible over public-private keypair. The private key is generated on the system from where you want to connect to our minecraft host server.
  The corresponding public key is stored in the file /home/ansible/.ssh/authorized_keys of your minecraft host server.
- The user "ansible" has a locked password ($ passwd -l ansible). Authentication over a password will not work even when you try it from the hosts terminal

# Variables:
The following variables can be defined. Some of them are mandatory.

## Mandatory Variables:
  - mc_version (String): Defines the Minecraft Server Version to be used for the installation

## Optional Variables:
- apt_packages_list (List of Strings): The list of packages to be installed using apt. Default packages are:
  - screen 
  - openjdk-19-jre-headless
  - ufw
  - vim 
- type (spiggot|craftbukkit): The type of server to be installed. Default is "spiggot"


  
