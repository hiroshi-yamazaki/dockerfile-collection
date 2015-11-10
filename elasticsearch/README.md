- build container
```
docker build -t elasticsearch:latest .
```

- run container
```
docker run --privileged -d -i -p 3306:3306 -p 9200:9200 -p 9300:9300 -t -h 'elasticsearch' --name 'elasticsearch.sample' elasticsearch:latest
```
