#docker stop mariadb-container
#
#docker rm mariadb-container
#
#docker rmi mariadb-0
#
#docker build -f mariadb.Dockerfile -t mariadb-0 .
#
#docker run -d --name mariadb-container -p 3333:3306 mariadb-0

docker stop apache

docker rm apache

docker rmi apache-0

docker build -f wordpress.Dockerfile -t apache-0 .

docker run -d --name apache -p 8080:80 apache-0