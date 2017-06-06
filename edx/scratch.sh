
#by partition
df --output=ipcent,target
#parsing results
    grep -oE "[0-9]{1,3}%"
    or split

#by subfolder/file
du -sh * | sort -h -r | head -n 5

/var/lib/mysql

pushd /datadisks/disk1
mkdir -p var/lib/mysql
popd

mv -v lexoxabvtc12mysql1-slow.log /datadisks/disk1/var/lib/mysql/

# todo: timestamped subfolder
# todo: release,close big files lsof -c mysql | grep -I deleted | uniq


---- notes
show variables like '%slow_query%';
    slow_query_log
    slow_query_log_file

---- log rotation
    is slow log on?
        is file greater than > threshold ? | force-rotate?
            SET GLOBAL slow_query_log=off;
                
                slow_query_log_file <= /datadisks/disk1/var/lib/mysql/lexoxabvtc12mysql1-slow.log
                ?chown mysql:mysql *log
            slow_query_log <= ON