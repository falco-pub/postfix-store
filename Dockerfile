FROM alpine:3.6
RUN apk update
RUN apk add --no-cache --update postfix ca-certificates supervisor rsyslog bash
RUN apk add --no-cache --update procmail

COPY /etc/supervisord.conf /etc/

COPY /etc/postfix/* /etc/postfix/
RUN postmap /etc/postfix/virtual
RUN newaliases

COPY run.sh .
RUN chmod +x run.sh

COPY /etc/procmailrc /etc
RUN chmod 6751 /usr/bin/procmail
RUN mkdir /var/spool/mail

RUN addgroup -g 500 user \
    && adduser -D -h /home/user -G user -u 500 user

EXPOSE 25

VOLUME /var/log
VOLUME /var/spool/mail

CMD ["./run.sh"]
