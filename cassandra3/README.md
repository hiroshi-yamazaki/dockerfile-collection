- build container
```
docker build -t cassandra3:latest .
```

- run container
```
docker run --privileged -d -i -t -h 'cassandra3' --name 'cassandra3.sample' cassandra3:latest
```
