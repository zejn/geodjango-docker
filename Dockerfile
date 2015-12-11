

FROM debian:oldstable

RUN     echo Woo start! \
        && echo 'APT::Install-Recommends "0";\nAPT::Install-Suggests "0";' > /etc/apt/apt.conf.d/norecommends.conf \
        && sed -e 's/^deb /deb-src /g' < /etc/apt/sources.list >> /etc/apt/sources.list \
        && apt-get update \
        && echo 'localepurge localepurge/nopurge multiselect en_US,en_US.UTF-8\nlocalepurge localepurge/use-dpkg-feature boolean true' | debconf-set-selections \
        && apt-get -y install localepurge \
        && apt-get -y install python2.7 python-virtualenv git postgresql-common libpq-dev libgeos-dev libproj-dev proj-bin libgdal-dev gdal-bin \
        && apt-get -y build-dep python-lxml python-psycopg2 \
        && apt-get -y clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*




