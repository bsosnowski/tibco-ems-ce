ARG_EMS_VER=10.3.0
ARG_EMS_VER_SHORT=10.3
ARG_EMS_DIST_PATH=./dist

docker build --build-arg EMS_VER=$ARG_EMS_VER \
             --build-arg EMS_VER_SHORT=$ARG_EMS_VER_SHORT \
             --build-arg EMS_DIST_PATH=$ARG_EMS_DIST_PATH \
             -t tibco/ems-ce:$ARG_EMS_VER .
docker image prune --force \
                   --filter "label=vendor=TIBCO" \
                   --filter "label=intermediate=true"
