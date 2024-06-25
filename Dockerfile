ARG EMS_VER
ARG EMS_VER_SHORT

FROM debian:bookworm-slim as build

LABEL vendor="TIBCO"
LABEL intermediate=true

ARG EMS_VER
ARG EMS_VER_SHORT
ENV EMS_VER_VAR=$EMS_VER
ENV EMS_VER_SHORT_VAR=$EMS_VER_SHORT
ARG EMS_DIST_PATH

ENV EMS_ARCHIVE=TIB_ems_${EMS_VER_VAR}_linux_x86_64.zip
ENV SEVER_ARCHIVE=TIB_ems_${EMS_VER_VAR}_linux_x86_64-server.tar.gz
ENV THIRD_PARTY_ARCHIVE=TIB_ems_${EMS_VER_VAR}_linux_x86_64-thirdparty.tar.gz

COPY ${EMS_DIST_PATH}/${EMS_ARCHIVE} /
COPY config/data /opt/tibco/ems/config/data
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends unzip && \
    unzip ${EMS_ARCHIVE} && \
    tar xvf /TIB_ems_${EMS_VER_VAR}/tar/$SEVER_ARCHIVE && \
    tar xvf /TIB_ems_${EMS_VER_VAR}/tar/$THIRD_PARTY_ARCHIVE && \
    mkdir /opt/tibco/ems/datastore && \
    mkdir /opt/tibco/ems/log/

FROM debian:bookworm-slim

ARG EMS_VER_SHORT
ENV EMS_VER_SHORT_VAR=$EMS_VER_SHORT

LABEL vendor="TIBCO"
LABEL version=${EMS_VER_SHORT_VAR}
LABEL maintainer="bartosz.sosnowski@outlook.com"

ENV TIBCO_HOME=/opt/tibco
ENV EMS_CONFIG=$TIBCO_HOME/ems/config/data
ENV EMS_PORT=7222
ENV EMS_METRICS_PORT=7220

COPY --from=build /opt /opt

RUN groupadd tibco && \
    useradd -g tibco tibco && \
    chown -R tibco:tibco $TIBCO_HOME

USER tibco
EXPOSE $EMS_PORT
EXPOSE $EMS_METRICS_PORT
ENTRYPOINT ${TIBCO_HOME}/ems/${EMS_VER_SHORT_VAR}/bin/tibemsd -config $EMS_CONFIG/tibemsd.json