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
