#!/bin/bash
yum install -y httpd
echo "Subnet for Firewall: ${firewall_subnets}" >> /var/www/html/index.html
service httpd start
chkconfig httpd on