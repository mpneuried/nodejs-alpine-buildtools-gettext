FROM mhart/alpine-node:4.6
MAINTAINER mpneuried

# build tools for native dependencies
RUN apk add --update make gcc g++ python git lzip

# install gettext
ENV GETTEXT_VER=0.19.8
ENV GETTEXT_FNAME=gettext-$GETTEXT_VER
ENV GETTEXT_SOURCE=http://ftp.gnu.org/pub/gnu/gettext/$GETTEXT_FNAME.tar.lz

RUN wget $GETTEXT_SOURCE && \
  lzip -d -c $GETTEXT_FNAME.tar.lz | tar -xvf - && \
  cd $GETTEXT_FNAME && \
  ./configure && \
  make && \
  make install && \
  cd / && \
  rm -rf $GETTEXT_FNAME && \
  rm $GETTEXT_FNAME.tar.lz
