FROM openjdk:11-stretch

WORKDIR /opt

# common
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget unzip && \
    wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip && \
    unzip sonar-scanner-cli-4.0.0.1744-linux.zip && \
    rm -r /var/lib/apt/lists/*

LABEL image=analysis

CMD ['/opt/sonar-scanner-4.0.0.1744-linux/bin/sonar-scanner', 'help']
