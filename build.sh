#/bin/bash
docker rmi safepic/beef:latest
DOCKER_BUILDKIT=0 docker --debug build -t safepic/beef .
