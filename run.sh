#!/bin/bash

touch /var/log/maillog
touch /var/log/messages
chmod o+r /var/log/*
mkdir /var/spool/mail/.logs
/usr/bin/supervisord
