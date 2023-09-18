### Docker PAAC Prereqs info Steps

- `IAM` User with `ECR` Permissions
- add `AWS` Credentials to Jenkins 
- Create an `ECR` Repo
- install `ECR` on Jenkins
- install Docker Plugin Pipeline on Jenkins
- install Docker engine on Jenkins Instance

  - ```bash
  
    sudo -i
    apt update
    apt install awscli -y

    # 1 - Set up Docker's Apt repository.
      
    ## Add Docker's official GPG key:
    
    apt-get update
    apt-get install ca-certificates curl gnupg

    install -m 0755 -d /etc/apt/keyrings
    
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    
    chmod a+r /etc/apt/keyrings/docker.gpg
    
    ## Add the repository to Apt sources:
    echo \
      "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    
    tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    apt-get update

    # 2 - Install the Docker packages
    apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

    # 3 - Verify that the Docker Engine installation is successful by running the hello-world image
    docker run hello-world

    # 4 - add Jenkins to docker groub
    usermod -a -G docker jenkins

  ```
