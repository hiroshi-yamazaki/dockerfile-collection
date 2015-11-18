- build container
```
docker build -t hbase112:latest .
```

- run container
```
docker run --privileged -d -i -t -h 'hbase112' --name 'hbase112.sample' hbase112:latest
```
