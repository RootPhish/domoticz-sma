FROM sdesbure/domoticz:latest

ENV SBFSPOTDIR=/opt/sbfspot
ENV SMADATA=/var/smadata

RUN apk add --no-cache sqlite \
                       sqlite-dev \
                       make \
                       boost-dev \
                       g++ \
                       bluez-dev

ADD dist/SBFspot*.tar.gz /sbfspot.3/
ADD dist/misc.patch /sbfspot.3/misc.patch

WORKDIR /sbfspot.3/SBFspot
RUN patch -p1 -i ../misc.patch
RUN make install_sqlite

WORKDIR /

RUN mkdir -p $SBFSPOTDIR && \
    mkdir -p $SMADATA

RUN mv /usr/local/bin/sbfspot.3/* $SBFSPOTDIR && \
    cp /sbfspot.3/SBFspot/CreateSQLiteDB.sql $SBFSPOTDIR && \
    rm -rf /sbfspot.3

RUN sqlite3 $SMADATA/SBFspot.db < $SBFSPOTDIR/CreateSQLiteDB.sql

RUN apk del g++ make
