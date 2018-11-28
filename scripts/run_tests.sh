#!/bin/sh

echo "${repoPrivateKeyBase64}" | base64 -d > /root/.ssh/id_rsa

chmod 600 /root/.ssh/id_rsa

GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone $repoUrl testcode

cd testcode

mvn clean install -P${mavenProfile}

