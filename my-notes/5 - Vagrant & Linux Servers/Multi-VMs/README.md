```bash

# Launch all VMs #
vagrant up

# Close all VMs #
vagrant halt

# Delete all VMs #
vagrant destroy

## ------------- OR ------------- ##

# Launch ubuntuVM1 VM #
vagrant ubuntuVM1

# Close ubuntuVM1 VM #
vagrant ubuntuVM1

# Delete ubuntuVM1 VM #
vagrant ubuntuVM1

## ------------- OR ------------- ##

# Launch centOSVM2Mariadb VM #
vagrant centOSVM2Mariadb

# Close centOSVM2Mariadb VM #
vagrant centOSVM2Mariadb

# Delete centOSVM2Mariadb VM #
vagrant centOSVM2Mariadb

```

- login into The 1st VM `ubuntuVM1`
  
  - ```bash
    vagrant ssh ubuntuVM1
    ```

- login into The 2nd VM `centOSVM2Mariadb`
  
  - ```bash
    vagrant ssh centOSVM2Mariadb
    ```