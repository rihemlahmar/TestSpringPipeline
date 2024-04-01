FROM openjdk:21-jdk
MAINTAINER BePrimeTech <contact@beprimetech.com>
ADD target/version_tag.jar  version_tag.jar
# Create a directory for the Debugger. Add and unzip the agent in the directory.
RUN mkdir /opt/cdbg && \
    wget -qO- http://storage.googleapis.com/cloud-debugger/compute-java/debian-wheezy/cdbg_java_agent_gce.tar.gz | \
    tar xvz -C /opt/cdbg
ENTRYPOINT ["java", "-agentpath:/opt/cdbg/cdbg_java_agent.so", "-Dcom.google.cdbg.module=back-office", "-Dcom.google.cdbg.version=v1.0.0", "-Dcom.google.cdbg.breakpoints.enable_canary=false", "-XX:+HeapDumpOnOutOfMemoryError", "-XX:HeapDumpPath=/tmp/dumps", "-jar","-Dspring.profiles.active=prod", "/version_tag.jar"]
EXPOSE 8080
