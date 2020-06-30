FROM maven:3.6.3-adoptopenjdk-11

ADD ./ /build

WORKDIR /build
RUN mvn clean package


FROM adoptopenjdk/openjdk11:alpine-jre
COPY --from=0 /build/jmx_prometheus_javaagent/target/jmx_prometheus_javaagent-*.jar /opt/jmx_exporter/jmx_prometheus_javaagent-0.13.1.jar

CMD ["/bin/bash"]
