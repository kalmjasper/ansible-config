Ansible Playbook Repository
===========================

This repository contains Ansible playbooks for various server configurations and setups.

Requirements
------------

-   Ansible installed on the control machine.
-   SSH access to the target servers.
-   Passwordless sudo enabled

Running the Playbook
--------------------

To run a playbook, use the `ansible-playbook` command. For instance, to execute the `main.yml` playbook on a specific host with a specific user and port, you can use the following:

bashCopy code

`ansible-playbook main.yml -i '192.168.1.10,' -e 'ansible_user=username ansible_port=2222,`

-   `username`: SSH user for the remote server.
-   `192.168.1.10`: IP address of the remote server.
-   `2222`: SSH port on the remote server.

Always include the trailing comma `,` to indicate direct host specification.