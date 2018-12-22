FROM gradle:alpine

WORKDIR /app

COPY ./ /app/

USER root

RUN gradle build


FROM openjdk:8-alpine

WORKDIR /app

COPY bin/start.sh /app/start.sh
COPY --from=0 /app/build/libs/helloworld-jvm-*.jar /app

ENTRYPOINT ["/app/start.sh"]

EXPOSE 8080
