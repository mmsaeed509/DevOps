# Ansible

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
