# See https://docs.docker.com/engine/reference/builder/#format
#     https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/
#
# Basics
#
FROM alpine:latest

# MAINTAINER is obsolete, use LABEL instead
# Query LABELs using docker inspect
LABEL maintainer="thomas.wetzler@t-systems.com"

RUN mkdir -p /root/elastic
COPY files/busybox.sh /root/busybox.sh
RUN chmod u+x /root/busybox.sh

CMD ["/root/busybox.sh"]
