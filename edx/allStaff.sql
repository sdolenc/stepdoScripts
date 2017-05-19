
update auth_user set is_active=1 where id>0;
update auth_user set is_staff=1 where id>0;

# Prefix created with
#   https://crontab.guru/every-1-minute/#*/5_*_*_*_*
# Prefix verified with
#   grep CRON /var/log/syslog | grep allStaff
#
# */5  *    * * *   root  /usr/bin/mysql --user=[REPLACE] --password=[REPLACE] [dbREPLACE] < [pathREPLACE]/allStaff.sql
