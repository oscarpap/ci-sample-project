
docker stop pgserver || true && docker rm pgserver || true
docker stop goserver || true && docker rm goserver || true
docker stop nginxserver || true && docker rm nginxserver || true

docker build -t go Go

docker build -t pg PostgresSQL

docker build -t nginx NGINX

docker run --name pgserver -it -d pg

sleep 5

docker run --name goserver --link pgserver:db go

go test

sleep 5

docker run --name nginxserver --link goserver:app nginx

sleep 5

docker stop pgserver
docker stop goserver
docker stop nginxserver
docker rm pgserver
docker rm goserver
docker rm nginxserver
