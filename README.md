# VagrantPress

## Creating new environment

1. Run the ProvisionNewEnv.sh command as follows
	bash ProvisionNewEnv.sh
2. You will be prompted for configuration options which used to configure the database and launch the Vagrant box.
3. A text file called initalconfig.txt is created and needs to be  uploaded to SS.


## Starting an existing environment

1. Copy the initalconfig.txt file that should be located in SS to the Vagrant's base directory

2. Run the ExistingProject.sh command as follows:
	bash ExistingProject.sh



## Notes

To log in to the local Wordpress installation at http://localhost:8080/wp-admin/ the username is whatever was selected when the environment was initially configured and the password is `vagrant`.

## A Few Details

* I’m running this on a local ‘box’ (working on importing this one to S3) of Ubuntu 12.04LTS 64-bit.  This might be a bit full blown for a development environment - feel free to edit the Vagrantfile to include any other box you may have.  (My goal is to get a ‘real’ box loaded to S3 so the install/run is seamless.)

* If you're needing a password (for anything - including mysql, it should be `vagrant`)

## UPDATES (June 2013)

* Thanks to some really great help, vagrantpress runs much faster.  We're using the release version of WordPress (instead of cloning the GitHub repository) and there are some sensible defaults added to the puppet scripts.


