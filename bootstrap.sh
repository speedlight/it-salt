#!/bin/bash
cd /etc/yum.repos.d/
wget http://copr.fedoraproject.org/coprs/saltstack/salt-el5/repo/epel-5/saltstack-salt-el5-epel-5.repo
yum makecache
yum install salt-minion -y
chkconfig salt-minion on
service salt-minion start
