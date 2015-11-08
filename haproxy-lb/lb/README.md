- build container
```
docker build -t haproxy-lb:latest .
```
- run container
```
docker run --privileged -d -i -t -h 'lb' --name 'lb.sample' haproxy-lb:latest
```
