to connect to an instance

```bash
ssh -i "web-dev-key.pem" ec2-user@ec2-3-86-244-28.compute-1.amazonaws.com
```

<details>

   <summary><h4> you may be facing this issue <code>Load key "web-dev-key.pem": bad permissions</code> </h4></summary>

   
```bash
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0644 for 'web-dev-key.pem' are too open.
It is required that your private key files are NOT accessible by others.
This private key will be ignored.
Load key "web-dev-key.pem": bad permissions
ec2-user@ec2-3-86-244-28.compute-1.amazonaws.com: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
```
    
to resolve it
    
```bash
chmod 400 web-dev-key.pem
```

</details>
