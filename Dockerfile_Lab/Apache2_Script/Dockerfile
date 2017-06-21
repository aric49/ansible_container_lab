FROM ubuntu:16.04

RUN apt-get update; apt-get install -y apache2
COPY docker_entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/docker_entrypoint.sh

EXPOSE 80

ENTRYPOINT ["docker_entrypoint.sh"]
