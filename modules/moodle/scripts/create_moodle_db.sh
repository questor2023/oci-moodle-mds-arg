#!/bin/bash

#mysqlsh ${admin_username}:'${admin_password}'@${mds_ip} --sql -e "CREATE DATABASE ${moodle_schema};"
#mysqlsh ${admin_username}:'${admin_password}'@${mds_ip} --sql -e "CREATE USER ${moodle_name} identified by '${moodle_password}';"
#mysqlsh ${admin_username}:'${admin_password}'@${mds_ip} --sql -e "GRANT ALL PRIVILEGES ON ${moodle_schema}.* TO ${moodle_name};"

DEDICATED=${dedicated}
INSTANCE=${instancenb}

if [ "$DEDICATED" == "true" ]
then
   moodleschema="${moodle_schema}$INSTANCE"
   moodlename="${moodle_name}$INSTANCE"
else
   moodleschema="${moodle_schema}"
   moodlename="${moodle_name}"
fi


mysqlsh --user ${admin_username} --password=${admin_password} --host ${mds_ip} --sql -e "CREATE DATABASE $moodleschema;"
mysqlsh --user ${admin_username} --password=${admin_password} --host ${mds_ip} --sql -e "CREATE USER $moodlename identified by '${moodle_password}';"
mysqlsh --user ${admin_username} --password=${admin_password} --host ${mds_ip} --sql -e "GRANT ALL PRIVILEGES ON $moodleschema.* TO $moodlename;"

echo "Moodle Database and User created !"
echo "MOODLE USER = $moodlename"
echo "MOODLE SCHEMA = $moodleschema"
