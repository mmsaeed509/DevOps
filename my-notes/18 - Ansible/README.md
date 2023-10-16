# Ansible

Ansible: Streamlining Automation for Infrastructure Management

Introduction:
Ansible is a powerful open-source automation tool that simplifies the management and configuration of IT infrastructure. It operates on the principle of Infrastructure as Code (IaC), allowing users to define their infrastructure in a declarative manner and automate repetitive tasks. This brief overview delves into key Ansible concepts and components.

Inventory & Ping Module:
- Inventory: The inventory file, typically written in INI or YAML format, lists the hosts and groups Ansible will manage.
- Ping Module: The 'ping' module is used to verify connectivity with hosts in the inventory, ensuring Ansible can communicate with them.

Ad Hoc:
Ad hoc commands are one-off tasks executed directly from the command line without the need for playbooks. They are ideal for quick tasks like running system updates or gathering information from remote hosts.

Playbook & Modules:
- Playbook: A playbook is a YAML file that defines a series of tasks, or plays, to be executed on remote hosts. Playbooks are the core of Ansible automation.
- Modules: Ansible modules are small, reusable units of code that perform specific tasks on managed hosts. Ansible offers a vast library of modules for different use cases, such as 'apt' for package management and 'service' for service control.

Group & Host Variables:
- Group Variables: These are variables defined for a group of hosts in the inventory. They can be used to apply common configurations or settings to a group of hosts.
- Host Variables: These are variables specific to individual hosts in the inventory, allowing fine-grained control over host configurations.

Decision Making:
Ansible provides conditional statements within playbooks, like 'when' clauses, to make decisions based on specific conditions. This allows for dynamic execution of tasks.

Loops:
Loops in Ansible playbooks enable repetitive task execution. Common loop types include 'with_items' and 'loop' for iterating over lists or dictionaries.

File, Copy & Template Modules:
- File Module: Used to manage files and directories on remote hosts, enabling tasks like file creation, deletion, and permission management.
- Copy Module: This module copies files from the control node to remote hosts.
- Template Module: Templating allows the dynamic generation of configuration files by filling in variables from Ansible.

Handlers:
Handlers are special tasks triggered only when notified by other tasks. They are useful for handling events like service restarts after a configuration change.

Roles:
Roles are a way to organize and structure playbooks. They allow for the reuse of tasks, variables, and modules across multiple playbooks. Roles promote code modularity and maintainability in Ansible projects.

In summary, Ansible is a versatile and efficient automation tool for managing infrastructure. By understanding these fundamental components and concepts, you can harness the full power of Ansible to simplify and streamline your IT operations.

> **_NOTE:_** 
> 
> **difference between scripting and configuration management tool.
> configuration management tool checks if the command is applied or not 
> It compares if not applied it will apply it, if it is applied it won't apply it
> 
> and it manages the state:
> if the target is in a different state it applies the changes
> if in the same state, it is not apply the changes
> else it goes to fail
> e.g: if the pkg is installed it will remove it once you change the status of the pkg
> 
> scripting does not compare and apply it.**
> 

### Install (arch)

```bash

yay -S ansible

## OR

sudo pacman -S ansible

```

___

<details>
   <summary><h3> <code>yaml</code> file (<code>inventory.yml</code>) </h3></summary>
 
```yml
---

all:
  hosts:
    # add the 1st instance
    web1:
      ansible_host: 54.91.118.9
      ansible_user: ec2-user
      ansible_ssh_private_key_file: ~/Downloads/aws.pem

    # add the 2nd instance
    web2:
      ansible_host: 54.162.53.98
      ansible_user: ec2-user
      ansible_ssh_private_key_file: ~/Downloads/aws.pem

    # add the 3rd instance
    db1:
      ansible_host: 34.228.208.19
      ansible_user: ec2-user
      ansible_ssh_private_key_file: ~/Downloads/aws.pem
  children:
    webservers:
      hosts:
        web1:
        web2:
    dbservers:
      hosts:
        db1:
    allServers:
      children:
        webservers:
        dbservers:

```

</details>

___

<details>
   <summary><h3> <code>yaml</code> file (<code>vars-in-groups.yml</code>) </h3></summary>
 
```yml
---

all:
  hosts:
    # add the 1st instance
    web1:
      ansible_host: 54.91.118.9

    # add the 2nd instance
    web2:
      ansible_host: 54.162.53.98

    # add the 3rd instance
    db1:
      ansible_host: 34.228.208.19

  children:

    webservers:
      hosts:
        web1:
        web2:
  
    dbservers:
      hosts:
        db1:
  
    allServers:
      children:
        webservers:
        dbservers:
      vars:
        ansible_user: ec2-user
        ansible_ssh_private_key_file: ~/Downloads/aws.pem

```

</details>

#### ping all hosts

```bash

ansible allServers -m ping -i inventory.yml

## OR

ansible all -m ping -i inventory.yml

## OR

ansible "*" -m ping -i inventory.yml

# ping for all web instances (web1, web2) #
ansible "web*" -m ping -i inventory.yml

```

### Ad Hoc

```bash

# --become -> for scale privileges run `sudo`
ansible web1 -m ansible.builtin.yum -a "name=httpd state=present" -i vars-in-groups.yml --become

```
<details>
   <summary><h4> output </h4></summary>

```bash

web1 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "msg": "",
    "rc": 0,
    "results": [
        "Installed: apr-1.7.0-11.el9.x86_64",
        "Installed: httpd-filesystem-2.4.57-5.el9.noarch",
        "Installed: mod_lua-2.4.57-5.el9.x86_64",
        "Installed: centos-logos-httpd-90.4-1.el9.noarch",
        "Installed: apr-util-1.6.1-23.el9.x86_64",
        "Installed: apr-util-bdb-1.6.1-23.el9.x86_64",
        "Installed: httpd-tools-2.4.57-5.el9.x86_64",
        "Installed: httpd-2.4.57-5.el9.x86_64",
        "Installed: mailcap-2.1.49-5.el9.noarch",
        "Installed: mod_http2-1.15.19-5.el9.x86_64",
        "Installed: apr-util-openssl-1.6.1-23.el9.x86_64",
        "Installed: httpd-core-2.4.57-5.el9.x86_64"
    ]
}

```

</details>

___

```bash

ansible webservers -m ansible.builtin.yum -a "name=httpd state=present" -i vars-in-groups.yml --become

```

<details>
   <summary><h4> output </h4></summary>

```bash

web1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "msg": "Nothing to do",
    "rc": 0,
    "results": []
}
web2 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "msg": "",
    "rc": 0,
    "results": [
        "Installed: apr-1.7.0-11.el9.x86_64",
        "Installed: httpd-filesystem-2.4.57-5.el9.noarch",
        "Installed: mod_lua-2.4.57-5.el9.x86_64",
        "Installed: centos-logos-httpd-90.4-1.el9.noarch",
        "Installed: apr-util-1.6.1-23.el9.x86_64",
        "Installed: apr-util-bdb-1.6.1-23.el9.x86_64",
        "Installed: httpd-tools-2.4.57-5.el9.x86_64",
        "Installed: httpd-2.4.57-5.el9.x86_64",
        "Installed: mailcap-2.1.49-5.el9.noarch",
        "Installed: mod_http2-1.15.19-5.el9.x86_64",
        "Installed: apr-util-openssl-1.6.1-23.el9.x86_64",
        "Installed: httpd-core-2.4.57-5.el9.x86_64"
    ]
}

```

</details>

___

```bash

ansible webservers -m ansible.builtin.yum -a "name=httpd state=present" -i vars-in-groups.yml --become

```

<details>
   <summary><h4> output </h4></summary>

```bash
web2 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "msg": "Nothing to do",
    "rc": 0,
    "results": []
}
web1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "msg": "Nothing to do",
    "rc": 0,
    "results": []
}

```

</details>

___

#### remove `httpd`

```bash

ansible webservers -m ansible.builtin.yum -a "name=httpd state=absent" -i vars-in-groups.yml --become

```

<details>
   <summary><h4> output </h4></summary>

```bash

web1 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "msg": "",
    "rc": 0,
    "results": [
        "Removed: httpd-2.4.57-5.el9.x86_64",
        "Removed: mod_http2-1.15.19-5.el9.x86_64"
    ]
}
web2 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "msg": "",
    "rc": 0,
    "results": [
        "Removed: httpd-2.4.57-5.el9.x86_64",
        "Removed: mod_http2-1.15.19-5.el9.x86_64"
    ]
}

```

</details>

___

#### copy 

```bash

ansible-playbook -i inventory copy.yaml

```

<details>
   <summary><h4> output </h4></summary>

```bash

PLAY [webserver setup] ********************************************************************************************

TASK [Gathering Facts] ********************************************************************************************
The authenticity of host '107.20.18.152 (107.20.18.152)' can't be established.
ED25519 key fingerprint is SHA256:/2Bz3BO8uT0dLnjDkf2tYXwki/rzii0+5hLZLQHkElU.
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:30: 54.162.53.98
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
ok: [web1]
ok: [web2]

TASK [Install httpd] **********************************************************************************************
ok: [web2]
ok: [web1]

TASK [Start and Enable service] ***********************************************************************************
ok: [web2]
ok: [web1]

TASK [Copy index file] ********************************************************************************************
changed: [web2]
changed: [web1]

PLAY RECAP ********************************************************************************************************
web1                       : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
web2                       : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```

</details>

___
