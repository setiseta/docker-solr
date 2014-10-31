FROM pataquets/default-jre-headless

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get -y install \
		wget \
	&& \
	apt-get clean

ENV SOLR_VERSION 4.10.0
ENV SOLR solr-$SOLR_VERSION

#TODO: symlink instead of 'mv' as on makuk66/docker-solr
RUN \
 wget http://apache.rediris.es/lucene/solr/$SOLR_VERSION/$SOLR.tgz && \
 tar xvf $SOLR.tgz && \
 rm -v $SOLR.tgz && \
 mv $SOLR /opt/solr
