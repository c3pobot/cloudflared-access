#!/bin/bash
tag='c3pobot/cloudflared-access'

docker build -t "ghcr.io/${tag}:latest" .
docker push "ghcr.io/${tag}:latest"
