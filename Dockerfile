# run a tor relay in a container
#
# Bridge relay:
#	docker run -d \
#		--restart always \
#		-v /etc/localtime:/etc/localtime:ro \
#		-p 8443:8443 \
#   -p 8444:8444 \
# 		--name tor-relay \
# 		nueve9/tor.bridge -f /etc/tor/torrc
#

FROM alpine:latest
LABEL maintainer "nueve9"

RUN apk --no-cache add \
	bash \
	tor

# default port to used for incoming Tor connections
# can be changed by changing 'ORPort' in torrc
EXPOSE 8443
EXPOSE 8444

# copy in our torrc files
COPY torrc /etc/tor/torrc

# copy the run script
COPY run.sh /run.sh
RUN chmod ugo+rx /run.sh

# default environment variables
ENV RELAY_NICKNAME REINHILD
ENV RELAY_BANDWIDTH_RATE 50 MBytes
ENV RELAY_BANDWIDTH_BURST 50 MBytes
ENV RELAY_PORT 0.0.0.0:8443
ENV RELAY_TRANSPORT 0.0.0.0:8444

# make sure files are owned by tor user
RUN chown -R tor /etc/tor

USER tor

RUN mkdir /var/lib/tor/.tor
VOLUME /var/lib/tor/.tor
RUN chown -R tor /var/lib/tor/.tor

ENTRYPOINT [ "/run.sh" ]
