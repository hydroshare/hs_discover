# Build stage
FROM node:14.14.0 as build-stage

ARG VUE_APP_BUCKET_URL_PUBLIC_PATH
ARG VUE_APP_HYDROSHARE_URL

ADD . /
WORKDIR /
RUN npm install && \
    npm run build

# Production stage
FROM nginx:alpine

COPY --from=build-stage /dist /dist