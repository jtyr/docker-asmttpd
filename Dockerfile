FROM ubuntu AS builder

ARG asmttpd_version=0.4.6
ARG elfkickers_version=3.2

RUN apt-get update && apt-get install -y build-essential yasm

RUN mkdir -p /tmp/dist/data
ADD https://github.com/nemasu/asmttpd/archive/${asmttpd_version}.tar.gz /tmp
RUN tar -C /tmp -xf /tmp/${asmttpd_version}.tar.gz
RUN sed -i -r '/;-----Simple request logging/,/;-----End Simple logging/s/;([^-])/\1/' /tmp/asmttpd-${asmttpd_version}/main.asm
RUN make -C /tmp/asmttpd-${asmttpd_version} release
RUN cp /tmp/asmttpd-${asmttpd_version}/asmttpd /tmp/dist/

ADD http://www.muppetlabs.com/~breadbox/pub/software/ELFkickers-${elfkickers_version}.tar.gz /tmp
RUN tar -C /tmp -xf /tmp/ELFkickers-${elfkickers_version}.tar.gz
RUN make -C /tmp/ELFkickers-${elfkickers_version}
RUN /tmp/ELFkickers-${elfkickers_version}/sstrip/sstrip -z /tmp/dist/asmttpd


FROM scratch
MAINTAINER Jiri Tyr

COPY --from=builder /tmp/dist /

EXPOSE 80

CMD ["/asmttpd", "/data", "80"]
