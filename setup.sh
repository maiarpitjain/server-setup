#!/bin/bash
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config

sudo service sshd restart

sudo echo 'Ahead@123' | sudo passwd ec2-user --stdin

sudo yum install httpd24 php72 mysql57-server -y
sudo yum install php72-mysqlnd php72-mbstring php72-gd mod24_ssl -y

sudo wget https://files.phpmyadmin.net/phpMyAdmin/5.0.0/phpMyAdmin-5.0.0-all-languages.zip
sudo yum install zip -y
sudo unzip phpMyAdmin-5.0.0-all-languages.zip -d /var/www/html/
sudo mv /var/www/html/phpMyAdmin-5.0.0-all-languages /var/www/html/phpMyAdmin

sudo wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz
sudo tar -xvzf ffmpeg-release-amd64-static.tar.xz -C /usr/local/bin/
sudo mv /usr/local/bin/ffmpeg-4.2.2-amd64-static /usr/local/bin/ffmpeg
sudo ln -s /usr/local/bin/ffmpeg/ffmpeg /bin
sudo ln -s /usr/local/bin/ffmpeg/ffprobe /bin

sudo service httpd start
sudo service mysqld start
sudo chkconfig mysqld on
sudo chkconfig httpd  on




