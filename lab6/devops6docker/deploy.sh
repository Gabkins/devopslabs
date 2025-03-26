#!/bin/bash -x

docker stop nginx-cont
docker rm nginx-cont

docker build -t devops/nginx-server ./nginx

docker run -d --name nginx-cont -p 54321:80 \
	--restart unless-stopped \
	devops/nginx-server

docker ps -a
sleep 5
curl localhost:54321
docker logs -n 10 nginx-cont

