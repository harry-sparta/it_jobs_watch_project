# Python Project 1

IT Jobs Watch data package

## Developer codes
In It_Jobs_Watch_Data_Package

## DevEnv
vagrant

## Provisioning
Cookbooks in It_Jobs_Watch_Cookbook


## Blockers
Vagrant syncs the folders to default location instead of user specified location (/home/ubuntu)
It gets created in (/vagrant)


## Berks-Cookbooks
any variation to the main cookbook files will need to delete the berks-cookbooks and reinstall (berks install -> berks vendor).
Otherwise it will generate berks-cookbooks inside berks-cookbooks each berks install ran.

# Github trigger tests
test 1
