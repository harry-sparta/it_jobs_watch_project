# Python Project 1
IT Jobs Watch data package

## Content
- cookbooks (chef recipes and packer files)
- development (python code)
- project_task (task summary)

## Instructions
- Local environment
  - Vangrant up in directory it_jobs_watch_project to launch local environment
- CI pipeline
  - Make changes (or simply on README.md), commit and push via development branch to Github repository
- CD pipeline
  - Currently is failing at packer build when automated on Jenkins master
  - Alternatively, can use packer_deploy_man.json in directory it_jobs_watch_project/cookbooks/vagrant_provisioing to manually produce an AMI on AWS.
- Python code location
  - Should be in /home/ubuntu/development

## Objectives:
- **Development environment**.
  - Able to develop the code in the (development branch)
  - Access and test the code locally
  - Produce an image for testing
- **Testing environment**.
  - Set up a suitable environment to run tests
- **Production environment**.
  - Set up a suitable environment to produce a ready image that could be launched onto an instance to run the code

**Tools:** Vagrant, Chef, Github, Packer, AWS EC2/VPC/SC/NACL/AMI

## General pipelines and slave node AIM creation
**Development pipeline**
````
Python code (development) -> Localhost using VM (Vagrant) -> commit to Github (development branch)
                          -> Provisioning with Chef solo
                          -> Local testing
                          -> Local deployment of the code
````

**Python cookbook**
````
Cookbook -> packer -> produce AMI (slave) on AWS
````

**CI/ CD pipeline**
````
Updated python code (development) -> Github -> via webhook to Jenkins -> build to EC2 slave node (Testing) -> feedback back to Jenkins -> if successful -> Production slave node to create final AMI / and pushes the merged (development branch to master) code from Jenkins back to Github
````

## Developer codes
In It_Jobs_Watch_Data_Package

## Detailed workings
**Development Environment.**
The developer working on the local pipeline will make changes to the code in the development branch which is then commited and pushed to Github (development branch) repository. Also using packer to build an image that has a ready environment for testing the code.
Tools: Vagrant, Chef, AWS EC2/ VPC/ SC/ NACL, Git/Github
- Vagrantfile. Sets up a virtual machine
- Chef (solo). Configuration tool that provisions the environment
- Packer. Create an Amazon Machine Image (AMI) for the slave nodes.

**Automation server.**
A change on the developer's code and if commited and pushed to the Github (development branch) repository, triggers a push webhook to the Jenkins Master's public IP. Jenkins Master will then pull the updated code from Github (development branch) repository and runs testing (Pytest) on the code in a slave node (that was launched on an EC2 instance with the image produced in the development environment). After the test runs, Jenkins Master will provide feedback and if the tests build is successful, Jenkins Master will pushed to merged (development with master branch) code back to Github (master) repository to update it. And then it will triggers a second build, part of the CD pipeline (production).
Tools: Jenkins, Github
- Jenkins. Listen to webhooks from Github to manage the continuous integration (CI) between development and testing environments.
- Jenkins. Set up slave node using AMI and EC2 for the testing environment and slave node to create an AMI for production.
  - Tools: Jenkins, Github

**Testing Environment.**
The slave node launched on an instance using the image produced in the DevEnv that has the right environment to run the python code.

**AMI for production.**
Once, the first build (CI testing) completes, this second build (CD production) is triggered. This second slave node launched on an instance using the image produced in the DevEnv that has the right environment to run the python code and also Chef and packer to produce a AMI. The build should use packer to build and Chef to provision the final AMI ready for deployment on an instance.
Tools:
- Packages: Chef, packer, Java.

## Troubleshooting
- If any of the EC2 is rebooted, check:
  - Github webhook IP
  - Jenkin slave nodes' IP  -> Host
  - Jenkin slave node's security group -> update port 22 inbound access for Jenkins Master (changed)IP
- Creating slave node for Jenkins
  - ensure jenkins home directory is */jenkins on the slave node (agent). So that it can be accessed from the master without authentication errors to occurs frequently.
  - Also to add a user via ssh with */jenkins as home directory on the agent. To avoid further authentication errors, use jenkins as the user name.
  - Also make sure Java is installed on the slave nodes to allow Jenkin Master connection.
- Berks-Cookbooks
  - any variation to the main cookbook files will need to delete the berks-cookbooks and reinstall (berks install -> berks vendor).
  - Otherwise it will generate berks-cookbooks inside berks-cookbooks each berks install ran.

# Github trigger tests
test 1
test 2
