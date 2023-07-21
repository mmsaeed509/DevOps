
- `1` is for standard output `free -m 1> /dev/null`
  
  - ```bash
    free -m 1> /dev/null


    ###

    free -m
                   total        used        free      shared  buff/cache   available
    Mem:           15832        3592        9189         708        4065       12240
    Swap:              0           0           0

    ```


- `2` is for standard Error `free -m 2> /dev/null`
  
  - ```bash
    freesssss -m 2> /dev/null


    ######

    free -m 2> /dev/null
                  total        used        free      shared  buff/cache   available
    Mem:          15832        3657        9136         716        4061       12175
    Swap:             0           0           0

    ```

- `&` is for any kind of output `free -m &> /dev/null`
  
  - ```bash
    freesssss -m &> /dev/null

    ######

    free -m &> /dev/null

    ```

- No. Files `ls | wc -l`