ARG_EMS_VER=8.5.1
ARG_EMS_VER_SHORT=8.5
ARG_EMS_DIST_PATH=./dist

docker build --build-arg EMS_VER=$ARG_EMS_VER \
             --build-arg EMS_VER_SHORT=$ARG_EMS_VER_SHORT \
             --build-arg EMS_DIST_PATH=$ARG_EMS_DIST_PATH \
             -t tibco/ems-ce:8.5.1 . 
docker image prune --force \
                   --filter "label=vendor=TIBCO" \
                   --filter "label=intermediate=true"
