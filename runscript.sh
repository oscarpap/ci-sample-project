
docker build -t tdde06_go Go

docker build -t tdde06_pg PostgresSQL

docker build -t tdde06_nginx NGINX

docker stop pgserver || true && docker rm pgserver || true
docker stop go_server || true && docker rm go_server || true

docker run --name pgserver -it -d tdde06_pg

sleep 5

docker run --name go_server --link pgserver:db tdde06_go go test

docker stop pgserver
docker rm pgserver
docker rm go_server
