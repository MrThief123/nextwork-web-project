#!/bin/bash

# Install Tomcat
sudo yum install -y tomcat

# Install Apache HTTPD
sudo yum install -y httpd

# Configure Apache reverse proxy to Tomcat
sudo bash -c 'cat << EOF > /etc/httpd/conf.d/tomcat_manager.conf
<VirtualHost *:80>
  ServerAdmin root@localhost
  ServerName app.nextwork.com
  DefaultType text/html
  ProxyRequests Off
  ProxyPreserveHost On
  ProxyPass / http://localhost:8080/nextwork-web-project/
  ProxyPassReverse / http://localhost:8080/nextwork-web-project/
</VirtualHost>
EOF'
