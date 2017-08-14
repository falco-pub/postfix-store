#!/bin/bash

touch /var/log/maillog
touch /var/log/messages
chmod o+r /var/log/*

pushd /etc/postfix/
for f in `find -type f`; do
    c=`awk '/^#run:/ {gsub (/^#run:/,""); print $0}' $f`
    [ -z "$c" ] || ( echo + $c $f && eval $c $f )
done
popd

chmod 1777 /var/spool/mail
mkdir /var/spool/mail/.logs
chmod 1777 /var/spool/mail/.logs
mkdir /var/spool/mail/nobody
chown nobody: /var/spool/mail/nobody
mkdir /var/spool/mail/user
chown user: /var/spool/mail/user

/usr/bin/supervisord
