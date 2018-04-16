FROM alpine:3.7
WORKDIR /apex
RUN wget -O apex-install.sh 'https://up.apex.sh/install' && \
    export BINDIR=/usr/bin/ && \
    sh apex-install.sh && \
    cd / && \
    rm -r /apex/ && \
    mkdir /work
WORKDIR /work
ENTRYPOINT [ "up" ]
