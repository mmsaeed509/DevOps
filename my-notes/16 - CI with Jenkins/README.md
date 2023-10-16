Jenkins Overview:

Jenkins is a widely-used open-source automation server that facilitates the continuous integration and continuous delivery (CI/CD) process. It offers a versatile platform for automating software builds, testing, and deployment.

Freestyle Vs Pipeline As A Code:

- Freestyle: Jenkins allows users to create jobs using a graphical user interface, known as freestyle projects. These projects are easy to set up but lack flexibility and scalability.
- Pipeline As Code: Pipeline as Code (PaC) is a more powerful approach to defining build and deployment pipelines in code, typically using the Jenkinsfile. PaC offers greater control, versioning, and code-reusability, making it ideal for complex CI/CD workflows.

Installing Tools in Jenkins:

Jenkins can be extended by installing various tools and plugins. This enables users to integrate with other tools, languages, and technologies to tailor Jenkins to their specific needs.

Jobs:

In Jenkins, a job represents a single task in the CI/CD process, such as building, testing, or deploying an application. Jobs can be created and configured to automate specific tasks.

Plugins, Versioning & More:

Jenkins offers a vast library of plugins that extend its functionality. These plugins can be used to integrate Jenkins with various tools, services, and technologies. Versioning of plugins and Jenkins itself is crucial to ensure stability and security.

Plugins for CI:

Several plugins are available for CI tasks, including source code management, build tools integration, and test automation. These plugins enable Jenkins to automate the entire CI process.

Pipeline As Code Introduction:

Pipeline as Code (PaC) is a method of defining pipelines using code. Jenkinsfile is a common way to implement PaC, providing control, flexibility, and versioning capabilities for your CI/CD pipelines.

Code Analysis:

Code analysis tools can be integrated into Jenkins pipelines to ensure code quality, identify issues, and enforce coding standards.

Quality Gates:

Quality gates are checks that assess the quality of code and its readiness for deployment. Jenkins can integrate quality gates into the CI/CD process to ensure that only high-quality code is deployed.

CI for Docker:

Jenkins can automate the CI process for Docker containers, including building, testing, and pushing Docker images to registries.

Docker Pipeline As Code (PAAC):

Implementing Docker pipelines as code allows for the definition and automation of Docker-specific CI/CD workflows, ensuring consistent containerization and deployment.

AWS ECS Setup:

Jenkins can be integrated with Amazon Elastic Container Service (ECS) to automate the deployment of Docker containers to AWS infrastructure.

Cleanup:

Maintaining a clean and efficient Jenkins environment is crucial. Cleanup tasks involve removing old builds, artifacts, and unnecessary data to ensure optimal performance.

Build Triggers:

Jenkins supports various build triggers, including source code changes, scheduled builds, and manual triggers, allowing for flexible automation.

Jenkins Master and Slave:

Jenkins can distribute workload between a master and multiple slave nodes, enhancing performance and scalability by running builds and tasks on different machines.

Authentication & Authorization:

Jenkins provides robust authentication and authorization mechanisms to control user access and permissions, ensuring the security of CI/CD pipelines.

In summary, Jenkins is a versatile CI/CD automation server that offers both freestyle and Pipeline as Code options for building, testing, and deploying software. It can be extended with plugins, integrates with tools like Docker and AWS ECS, and provides robust authentication and authorization features to control access. Jenkins is a fundamental tool in the DevOps ecosystem for achieving efficient and automated software development and delivery.

### Pipeline

![Pipeline](./Pipeline.png)


### Install Jenkins (Ubuntu)

```bash

sudo -i

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
/usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

apt update

apt install openjdk-11-jdk openjdk-8-jdk awscli jenkins -y

```

___

### Create First Admin User

- Username `admin`
- Password `admin12345` 
- Full name `Jenkins Admin`
- E-mail address `admin@Jenkins`
- Jenkins [**`URL:`**](23.20.48.192:8080) (ip:8080)

___

### Nexus

- Username `admin`
- Password `admin12345`
- Nexus [**`URL:`**](54.160.83.678081) (ip:8081)

___

### Sonar

- Username `admin`
- Password `admin`
- Sonar [**`URL:`**](54.174.243.231) (ip)
- Tokens:
  -  `JenkinsAT` -> `4096bb477bee3756770dae5b0c133ebc85a4ad83`
- Sonar