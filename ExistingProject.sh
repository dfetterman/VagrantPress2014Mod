#!/bin/bash


#copy the wordpress init manifest that is used for consecutive runs
cp puppet/modules/wordpress/manifests/init-consecutiverun puppet/modules/wordpress/manifests/init.pp




IFS=","
while read dbnameVARiable dbuserVARiable dbpasswdVARiable dbhostVARiable adminemailVARiable adminnameVARiable dbadminuserVARiable
do




####
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


####
# set db name x2
sed -i -e s/dbnameVAR/$dbnameVARiable/g puppet/modules/wordpress/manifests/init.pp

# set db user x2
sed -i -e s/dbuserVAR/$dbuserVARiable/g puppet/modules/wordpress/manifests/init.pp

# set db password
sed -i -e s/dbpasswdVAR/$dbpasswdVARiable/g puppet/modules/wordpress/manifests/init.pp

rm puppet/modules/wordpress/manifests/init.pp-e


done < initialconfig.txt



