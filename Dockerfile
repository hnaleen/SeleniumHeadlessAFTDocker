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

COPY scripts/run_tests.sh /home/aft/run_tests.sh

COPY mvn/settings.xml /usr/share/maven/conf/settings.xml

CMD ["/home/aft/run_tests.sh"]