<h1 align=center><strong><em>Deployment 4</em></strong></h1>
<div align=left>This repository will contain information related to the deployment of the URL-shortner flask application. Details can be found in the Deployment instructions or the documentation linked below.</div>

## Location of Documentation:
* Deployment Document: [click here](https://github.com/bmol5/kuralabs_deployment_4/blob/main/Documentation/Deployment4.pdf)


## Deployment Objectives:
``` diff
+ [x] Demonstrate ability to deploy an application into a VPC using IaC.
+ [x] Gain experience configuring resources on Terraform.
```

## Deployment Instructions:
* Link to instructions: [click here](https://github.com/kura-labs-org/kuralabs_deployment_4/blob/main/Deployment-4_Assignment.pdf)


## Code Used:

### Jenkins Installation:
```
#!/bin/bash

sudo apt update
sudo apt -y install openjdk-11-jre
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get -y install jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
```


### Mypy Installation:
```
python3 -m pip install mypy
mypy –show-error-codes application.py 
```
