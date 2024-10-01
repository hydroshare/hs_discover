FROM node:14.14.0 as node-build

# Arg used by the node build for discovery app
# This is the path to the bucket where the static files are stored
# This should be the same as the STATIC_URL in the Django settings
ARG VUE_APP_BUCKET_URL_PUBLIC_PATH
ARG VUE_APP_HYDROSHARE_URL

ADD . /hydroshare

WORKDIR /hydroshare/hs_discover

RUN rm -rf static templates && \
    mkdir static templates && \
    mkdir templates/hs_discover && \
    mkdir static/js && \
    mkdir static/css && \
    npm install && \
    npm run build && \
    mkdir -p static/js && \
    mkdir -p static/css && \
    cp -rp templates/hs_discover/js static/ && \
    cp -rp templates/hs_discover/css static/ && \
    cp -p templates/hs_discover/map.js static/js/ && \
    echo "----------------js--------------------" && \
    ls -l static/js && \
    echo "--------------------------------------" && \
    echo "----------------css-------------------" && \
    ls -l static/css && \
    echo "--------------------------------------"