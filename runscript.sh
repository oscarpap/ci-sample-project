#Test run

docker stop pgserver || true && docker rm pgserver || true
docker stop goserver || true && docker rm goserver || true

docker build -t go Go

docker build -t pg PostgresSQL

docker run --name pgserver -it -d pg

sleep 5

docker run --name goserver --link pgserver:db go go test

sleep 5

docker stop pgserver
docker stop goserver
docker rm pgserver
docker rm goserver
