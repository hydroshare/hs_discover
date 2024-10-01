FROM node:14.14.0 as node-build

# Arg used by the node build for discovery app
# This is the path to the bucket where the static files are stored
# This should be the same as the STATIC_URL in the Django settings
ARG VUE_APP_BUCKET_URL_PUBLIC_PATH
ARG VUE_APP_HYDROSHARE_URL

ADD . /

WORKDIR /

RUN npm install && \
    npm run build