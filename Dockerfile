FROM alpine:3.20.1

RUN apk add --no-cache rsync

ARG TARGET
ARG TAG

COPY scripts/entrypoint.sh /entrypoint.sh

RUN mkdir /assets /assets-source
VOLUME /assets

COPY $TARGET/genesis/config/genesis.json /assets-source/
COPY $TARGET/variables.env /assets-source/

RUN echo "$TARGET-$TAG" > /assets-source/version
RUN echo "_ASSETS_VERSION=$TARGET-$TAG" >> /assets-source/variables.env

VOLUME /genesis
COPY $TARGET/genesis /genesis

ENTRYPOINT ["/entrypoint.sh"]
HEALTHCHECK --start-period=30s --start-interval=1s CMD ["ash", "-c", "[ -f /started ]"]
