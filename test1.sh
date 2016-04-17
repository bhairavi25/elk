#!/bin/bash

echo \"Hello world1\"$Server_name >> /root/testfile.txt
echo $SALT_API_USER >> /root/testfile.txt
echo $SALT_API_PASS >> /root/testfile.txt
echo $test_text1 >> /root/testfile.txt
echo $ip >> /root/testfile.txt
echo $mac_addr >> /root/testfile.txt
echo \"last line\" >> /root/testfile.txt
