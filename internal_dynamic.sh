#!/bin/bash
# By, Nikit Swaraj, DevOps, Minjar Cloud Solutions 2016
# This Script is used to change the IP of inventory file of ansible script dynamically.
# The dependency of this script is ec2.py, ec2.ini, jq and boto
      touch dynamic_hosts_list.txt
      HOST_FILE_PATH="$PWD/dynamic_hosts_list.txt"
      if [ -f $1 ]
          then
                #Getting the current ip of instances
                server1_IP=`python /usr/bin/ec2.py --refresh-cache --list | jq '.tag_Name_server1[0]'`
                server2_IP=`python /usr/bin/ec2.py --list | jq '.tag_Name_server2[0]'`
                server3_IP=`python /usr/bin/ec2.py --list | jq '.tag_Name_server3[0]'`
                server4_IP=`python /usr/bin/ec2.py --list | jq '.tag_Name_server4[0]'`
                IN_IP=`echo $server1_IP | tr -d '"'`
                IN_IP2=`echo $server2_IP | tr -d '"'`
                IN_IP3=`echo $server3_IP | tr -d '"'`
                IN_IP4=`echo $server4_IP | tr -d '"'`

             if [ $? == 0 ]
             then
                #Updating the host file with the new ip of instances
                echo "127.0.0.1 localhost localhost.localdomain server4" | tee $HOST_FILE_PATH;
                sed -i '$ a 127.0.0.1 localhost localhost.localdomain server3' $HOST_FILE_PATH;
                sed -i '$ a 127.0.0.1 localhost localhost.localdomain server2' $HOST_FILE_PATH;
                sed -i '$ a 127.0.0.1 localhost localhost.localdomain server1' $HOST_FILE_PATH;
                sed -i '$ a 127.0.0.1 im.shadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP2"' ww4.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP4"' www.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' redis.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' redis2.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP3"' back1.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' db1-master.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' db1-slave.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' db2-master.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' db2-slave.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' db3-master.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' db3-slave.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' db4-master.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' db4-slave.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' db5-master.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' db5-slave.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' internal-solr-female-internal-1048230868.us-east-1.elb.amazonaws.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' internal-solr-mailer-female-internal-1015909199.us-east-1.elb.amazonaws.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' internal-solr-mailer-male-internal-876970625.us-east-1.elb.amazonaws.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' internal-solr-male-internal-1543902445.us-east-1.elb.amazonaws.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' internal-solr-mixed-internal-1034267838.us-east-1.elb.amazonaws.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' solr-mixed-mailer.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' cha.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' db-memcached.shaadi.com' $HOST_FILE_PATH;
                sed -i '$ a '"$IN_IP"' db-mailers-master.shaadi.com' $HOST_FILE_PATH;
             else
                echo “ There is some error occurs during accessing the IP of Instances. Please check the tag name of Instances or ec2.ini file.”
             fi
      fi

