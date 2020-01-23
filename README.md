# Python Project 1

IT Jobs Watch data package

## Developer codes
In It_Jobs_Watch_Data_Package

## Development Environment
- Vagrantfile. Sets up a virtual machine
- Chef (solo). Call in Vagrant to provision the machine using the cookbook provisioning_vagrant
- Chef (solo) and packer. To create an Amazon Machine Image (AMI) for the slave nodes.
  - Tools: Vagrant, Chef, AWS EC2/ VPC/ SC/ NACL, Git/github

## Automation server
- Jenkins. A server set up in an EC2 on AWS.
- Jenkins. Listen to webhooks from Github to manage the continuous integration (CI) between development and testing environments.
- Jenkins. Set up slave node using AMI and EC2 for the testing environment and slave node to create an AMI for production.
  - Tools: Jenkins, Github

## Testing Environment
- AWS EC2 slave node. Gets configured on Jenkins. Make sure the user names, authentication and directories matches.
- Runs the python test (triggered by Jenkins)
- Triggers Jenkins to merge development and master branch on Github and/or to deployment.
  - Tools: Jenkins, terminal (command line), packer

## AMI for production
- Testing slave node. If successful testing in the testing slave node, triggers another jenkin build to produce an AMI on another slave node.
  - Packages: Python, Pip, Java
- AMI slave node for production.
  - Packages: Chef, packer, Java.

## General process flow
```
Python code (development) -> Github -> Jenkins -> EC2 slave node (Testing) -> Jenkins -> Production slave node to create AMI -> EC2 (Production)
                          -> Localhost (Vagrant)
````

## Blockers
Vagrant syncs the folders to default location instead of user specified location (/home/ubuntu)
It gets created in (/vagrant)


## Berks-Cookbooks
any variation to the main cookbook files will need to delete the berks-cookbooks and reinstall (berks install -> berks vendor).
Otherwise it will generate berks-cookbooks inside berks-cookbooks each berks install ran.

# Github trigger tests
test 1
test 2
