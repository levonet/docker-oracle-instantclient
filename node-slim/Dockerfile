FROM node:10-slim

ARG INSTANTCLIENT_VERSION

ADD download/oracle-instantclient${INSTANTCLIENT_VERSION}-basiclite-${INSTANTCLIENT_VERSION}.0.0.0-1.x86_64.rpm /tmp/
ADD download/oracle-instantclient${INSTANTCLIENT_VERSION}-devel-${INSTANTCLIENT_VERSION}.0.0.0-1.x86_64.rpm /tmp/
RUN apt-get update \
    && apt-get install -y --no-install-recommends alien libaio1 \
    && alien -i /tmp/oracle-instantclient${INSTANTCLIENT_VERSION}-basiclite-${INSTANTCLIENT_VERSION}.0.0.0-1.x86_64.rpm \
    && alien -i /tmp/oracle-instantclient${INSTANTCLIENT_VERSION}-devel-${INSTANTCLIENT_VERSION}.0.0.0-1.x86_64.rpm \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* /tmp/* /var/tmp/* \
    && apt-get purge -y --auto-remove alien

ENV LANG=en_US.UTF-8
ENV ORACLE_HOME=/usr/lib/oracle/${INSTANTCLIENT_VERSION}/client64
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib
