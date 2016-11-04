FROM scratch
MAINTAINER Jiri Tyr

COPY asmttpd /asmttpd
COPY data /data

EXPOSE 80

CMD ["/asmttpd", "/data"]
