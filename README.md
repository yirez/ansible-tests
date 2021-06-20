Creation of a cluster infra via terraform for ansible tests

see: https://irezyigit.medium.com/learning-ansible-from-nothing-to-something-part1-6d75ae4a55fd

All below playbooks use the same inv.txt as targets

- ans/copyfile: basic playbook to copy file from src to dest. It will create the folder if it doesn't exist.
- ans/firstplaybook: basic playbook to ping targets
- ans/nginxbook: installs items in packages. Reads from var.
- ans/rolebook: installs items in packages. Reads from var. Does the same thing as nginxbook but from a created role.
- ans/phpplaybook: installs and deploys a complete LAMP stack app from scratch.
