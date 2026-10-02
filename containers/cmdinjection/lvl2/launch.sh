docker rm -f victim
docker build --tag full -f cmdinjection.dockerfile -t victim .
docker run -d -p 80:80 --name victim victim 