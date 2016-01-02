#!/bin/bash

DB_USER=root
DB_PASS=1234qwer

mysqld_safe &
sleep 3
echo "grant all privileges on *.* to ${DB_USER}@'%' identified by '${DB_PASS}' with grant option" | mysql -u root

