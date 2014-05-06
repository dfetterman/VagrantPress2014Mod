#!/bin/bash


echo "set the database name (ex. project_dev)"
read dbnameVARiable

echo "set the database user (This is the user created specifically for this database and project)"
read dbuserVARiable

echo "set the database user password (This is the password for newly created user)"
read dbpasswdVARiable

echo "set the database host (ex. Use the IP of remote db server or use localhost for local db only)"
read dbhostVARiable

echo "set wordpress admin e-mail"
read adminemailVARiable

echo "set wordpress admin user name (default password will be vagrant)"
read adminnameVARiable

echo "enter the existing db admin user (This is an existing db user with permissions to create database users and databases. If using localhost enter root as the user and vagrant as the password in the next prompt)"
read dbadminuserVARiable

echo "enter the existing db admin password"
read dbadmpasswdVARiable


#copy the wordpress init manifest that is used for first runs
cp puppet/modules/wordpress/manifests/init-firstrun puppet/modules/wordpress/manifests/init.pp


#### configure db credentials in wp-config so it can point to the db
# set db name
sed -i -e s/dbnameVAR/$dbnameVARiable/g puppet/modules/wordpress/files/wp-config.php

# set db user
sed -i -e s/dbuserVAR/$dbuserVARiable/g puppet/modules/wordpress/files/wp-config.php

# set db password
sed -i -e s/dbpasswdVAR/$dbpasswdVARiable/g puppet/modules/wordpress/files/wp-config.php

# set db host
sed -i -e s/dbhostVAR/$dbhostVARiable/g puppet/modules/wordpress/files/wp-config.php

#rm copy of oriiginal wp-config that sed creates
rm puppet/modules/wordpress/files/wp-config.php-e


####
# set admin e-mail
sed -i -e s/adminemailVAR/$adminemailVARiable/g puppet/modules/wordpress/files/wordpress-db.sql

#set admin user
sed -i -e s/adminnameVAR/$adminnameVARiable/g puppet/modules/wordpress/files/wordpress-db.sql

rm puppet/modules/wordpress/files/wordpress-db.sql-e


#### configure db credentials in wordpress manifest init which will be used to create the actual db
# set db name x2
sed -i -e s/dbnameVAR/$dbnameVARiable/g puppet/modules/wordpress/manifests/init.pp

# set db user x2
sed -i -e s/dbuserVAR/$dbuserVARiable/g puppet/modules/wordpress/manifests/init.pp

# set db password
sed -i -e s/dbpasswdVAR/$dbpasswdVARiable/g puppet/modules/wordpress/manifests/init.pp

# set db host
sed -i -e s/dbhostVAR/$dbhostVARiable/g puppet/modules/wordpress/manifests/init.pp

# set db admin user
sed -i -e s/dbadminuserVAR/$dbadminuserVARiable/g puppet/modules/wordpress/manifests/init.pp

# set db admin users password
sed -i -e s/dbadmpasswdVAR/$dbadmpasswdVARiable/g puppet/modules/wordpress/manifests/init.pp



rm puppet/modules/wordpress/manifests/init.pp-e

####
#create config file
echo "$dbnameVARiable,$dbuserVARiable,$dbpasswdVARiable,$dbhostVARiable,$adminemailVARiable,$adminnameVARiable,$dbadminuserVARiable" > initialconfig.txt




