#!/bin/bash

touch /var/log/maillog
touch /var/log/messages
chmod o+r /var/log/*

chmod 1777 /var/spool/mail 
mkdir /var/spool/mail/.logs     
chmod 1777 /var/spool/mail/.logs
mkdir /var/spool/mail/nobody
chown nobody: /var/spool/mail/nobody
mkdir /var/spool/mail/user
chown user: /var/spool/mail/user

/usr/bin/supervisord
