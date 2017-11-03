FROM lsiobase/xenial
MAINTAINER Poag

#Setup
RUN add-apt-repository ppa:jon-hedgerows/get-iplayer
  
# install packages
RUN \
 apt-get update && \
 apt-get install -y get-iplayer && \

# cleanup
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# ports and volumes
EXPOSE 1935
VOLUME /config /downloads

CMD ["/bin/bash", "get_iplayer_web_pvr"] 
