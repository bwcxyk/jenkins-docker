FROM jenkins/jenkins

ENV JENKINS_HOME="/data/jenkins"

USER root

RUN set -x \
    && curl -OL https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz \
    && tar -zxf docker-latest.tgz \
    && cp docker/docker /usr/local/bin/ \
    && rm -rf docker docker-latest.tgz \
    && curl -OL https://archive.apache.org/dist/maven/maven-3/3.6.2/binaries/apache-maven-3.6.2-bin.tar.gz \
    && tar -zxf apache-maven-3.6.2-bin.tar.gz \
    && mv apache-maven-3.6.2 /usr/local/maven \
    && rm -f apache-maven-3.6.2-bin.tar.gz \
    && curl -OL https://npm.taobao.org/mirrors/node/v12.13.1/node-v12.13.1-linux-x64.tar.gz \
    && ls -lh \
    && tar -zxf node-v12.13.1-linux-x64.tar.gz \
    && mv node-v12.13.1-linux-x64 /usr/local/nodejs \
    && rm -f node-v12.13.1-linux-x64.tar.gz \
    && echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

COPY settings.xml /usr/local/maven/conf/settings.xml

ENV NODE_HOME="/usr/local/nodejs"
ENV MAVEN_HOME="/usr/local/maven"
ENV PATH=${PATH}:${NODE_HOME}/bin:${MAVEN_HOME}/bin

RUN npm install -g cnpm --registry=https://registry.npm.taobao.org
