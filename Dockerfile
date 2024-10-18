FROM alpine:3
RUN apk upgrade -q && apk add -q zlib-dev g++ git make gcc cvs
RUN cvs -d :pserver:cvs@cvs.fefe.de:/cvs -z9 co libowfat && cd libowfat && make
RUN git clone git://erdgeist.org/opentracker && cd opentracker && make

FROM alpine:3
COPY --from=0 opentracker/opentracker /bin/opentracker
USER nobody
CMD ["opentracker"]
