FROM openjdk:11-stretch

RUN mkdir -p /var/www
COPY --from=test /var/www /var/www
WORKDIR /var/www

# common
RUN apt-get update && apt-get install -y --no-install-recommends wget unzip && rm -r /var/lib/apt/lists/*

RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip && \
    unzip sonar-scanner-cli-4.0.0.1744-linux.zip

LABEL image=analysis
