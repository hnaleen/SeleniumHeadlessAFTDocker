FROM selenium/standalone-chrome-debug:3.141.59-bismuth

RUN sudo mkdir /home/aft

WORKDIR /home/aft

RUN sudo apt update && sudo apt-get install -y \
 maven \
 openjdk-8-jdk \
 git

RUN sudo apt-get clean

ENV repoUrl=TEST_REPO_URL_NOT_PROVIDED

COPY scripts/run_tests.sh /home/aft/run_tests.sh

COPY scripts/main.sh /home/aft/main.sh

CMD ["/home/aft/main.sh"]
