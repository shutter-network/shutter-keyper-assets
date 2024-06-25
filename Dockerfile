FROM busybox:uclibc

ARG TARGET
ARG TAG

COPY scripts/entrypoint.sh /entrypoint.sh

RUN mkdir /assets

VOLUME /assets

COPY $TARGET/genesis/config/genesis.json /assets/
COPY $TARGET/variables.env /assets/

RUN echo "$TARGET-$TAG" > /assets/version

VOLUME /genesis
COPY $TARGET/genesis /genesis

ENTRYPOINT ["/entrypoint.sh"]
