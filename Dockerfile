FROM scratch
MAINTAINER Jiri Tyr

ADD root.tar.gz /
EXPOSE 80
VOLUME /var/www

CMD ["/bin/asmttpd", "/var/www"]
