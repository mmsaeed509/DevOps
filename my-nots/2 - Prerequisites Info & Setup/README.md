# [**`course repo`**](https://github.com/devopshydclub/vprofile-project)

> **_NOTE:_** 
> 
> ***If you use Linux, You don't have to do these steps***
> ***I'm using [**`Exodia OS`**](https://exodia-os.github.io/exodia-website/)(an Arch-based distro), I'll write all steps for installing any software.***


### install [**`Chocolatey`**](https://chocolatey.org/install)

- first of all, disable the antivirus

- open PowerShell

    - ```PowerShell
        Get-ExecutionPolicy
        Set-ExecutionPolicy AllSigned

        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

        ```

___

### install [**`Homebrew`**](https://brew.sh/)

- open terminal

  - ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/imran/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    
    ```
___

### install Tools In [**`Exodia OS`**](https://exodia-os.github.io/exodia-website/)(an Arch-based distro)

open terminal

- install virtualbox

  - ```bash
      
    install virtualbox-host-dkms virtualbox-guest-iso  virtualbox-guest-utils virtualbox-ext-oracle virtualbox-ext-vnc  virtualbox-sdk

    # OR (For all Arch-based distro)

    sudo pacman -S virtualbox-host-dkms virtualbox-guest-iso  virtualbox-guest-utils virtualbox-ext-oracle virtualbox-ext-vnc  virtualbox-sdk

    ```

- install vagrant

  - ```bash
      
    install vagrant

    # OR (For all Arch-based distro)

    sudo pacman -S vagrant

    # for older version
    sudo downgrade vagrant

    ```

- install corretto11jdk

  - ```bash
  
    yay -S corretto11jdk

    ```

- install the rest of the tools

  - ```bash  

    install git maven aws-cli intellij-idea-community-edition visual-studio-code-bin sublime-text-3 jdk8-openjdk
    
    # OR (For all Arch-based distro)
    
    sudo pacman -S git maven aws-cli intellij-idea-community-edition visual-studio-code-bin sublime-text-3 jdk8-openjdk
    
    ```
___

### install Tools In Ubuntu 20

- Install Virtualbox

  - ```bash

    sudo apt update

    sudo apt install virtualbox

    ```

- Install Vagrant

  - ```bash

     curl -O https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.deb

    sudo apt install ./vagrant_2.2.9_x86_64.deb

    ```

- Install Intellij community

  - ```bash

     sudo snap install intellij-idea-community --classic

    ```

- Install Intellij community

  - ```bash

    sudo apt update
    
    sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common

    curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

    sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"

    sudo apt install sublime-text

    ```

- install the rest of the tools

  - ```bash

    sudo apt-get install git openjdk-8-jdk maven awscli

    ```