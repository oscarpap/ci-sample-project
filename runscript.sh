
docker stop pgserver || true && docker rm pgserver || true
docker stop goserver || true && docker rm go_server || true

docker build -t go Go

docker build -t pg PostgresSQL

docker build -t nginx NGINX

docker run --name pgserver -it -d pg

sleep 5

docker run --name goserver --link pgserver:db go go test

docker stop pgserver
docker rm pgserver
docker rm goserver
