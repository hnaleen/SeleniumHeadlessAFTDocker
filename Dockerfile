FROM selenium/standalone-chrome-debug:3.141.59-bismuth

USER root

RUN mkdir /home/aft

WORKDIR /home/aft

RUN apt update && sudo apt-get install -y \
 maven \
 openjdk-8-jdk \
 git \
 iputils-ping \
 vim

RUN apt-get clean

ENV repoUrl=TEST_REPO_URL_NOT_PROVIDED

ENV repoPrivateKeyBase64=BASE_64_ENCODED_REPO_PRIVATE_SSH_KEY

ENV mavenProfile=MAVEN_PROFILE_NOT_SPECIFIED

COPY scripts/run_tests.sh /home/aft/run_tests.sh

COPY mvn/settings.xml /usr/share/maven/conf/settings.xml

RUN mkdir /root/.ssh/

CMD ["/home/aft/run_tests.sh"]