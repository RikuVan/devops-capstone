FROM gradle:7-jdk17 as build

USER root
COPY --chown=gradle:gradle . /home/gradle/project
WORKDIR /home/gradle/project
RUN gradle build

FROM amazoncorretto:17.0.6-al2022-RC

RUN yum -y install tar findutils
ARG HTTP_PORT=5000
ARG AWS_BUCKET
ARG S3_REGION=us-east-2
ARG AWS_CREDENTIALS
ARG BASIC_AUTH_CREDENTIALS

EXPOSE $HTTP_PORT

WORKDIR /app
COPY --from=build /home/gradle/project/build/distributions/Capstone.tar .
RUN tar -xf ./Capstone.tar
RUN rm ./Capstone.tar
ENTRYPOINT ["./Capstone/bin/Capstone"]