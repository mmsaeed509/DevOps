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

# Playbooks

```bash
ansible-playbook -i inventory.yml  web-db.yaml
```

<details>
   <summary><h4> output </h4></summary>

```bash

PLAY [webserver setup] **********************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************************************************************
ok: [web2]
ok: [web1]

TASK [Install httpd] ************************************************************************************************************************************************************************************************************************
ok: [web2]
ok: [web1]

TASK [Start and Enable service] *************************************************************************************************************************************************************************************************************
ok: [web2]
ok: [web1]
[WARNING]: Could not match supplied host pattern, ignoring: dbserver

PLAY [DBserver setup] ***********************************************************************************************************************************************************************************************************************
skipping: no hosts matched

PLAY RECAP **********************************************************************************************************************************************************************************************************************************
web1                       : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
web2                       : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```

</details>

___

add

```yaml
    - name: Start and Enable service
      ansible.builtin.service:
        name: mariadb
        state: started 
        enabled: yes
```

```bash
ansible-playbook -i inventory.yml  web-db.yaml
```

<details>
   <summary><h4> output </h4></summary>

```bash

PLAY [webserver setup] **********************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************************************************************
ok: [web1]
ok: [web2]

TASK [Install httpd] ************************************************************************************************************************************************************************************************************************
ok: [web2]
ok: [web1]

TASK [Start and Enable service] *************************************************************************************************************************************************************************************************************
ok: [web1]
ok: [web2]
[WARNING]: Could not match supplied host pattern, ignoring: dbserver

PLAY [DBserver setup] ***********************************************************************************************************************************************************************************************************************
skipping: no hosts matched

PLAY RECAP **********************************************************************************************************************************************************************************************************************************
web1                       : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
web2                       : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0


```

</details>

