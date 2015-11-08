- build container
```
docker build -t nginx-lb:latest .
```
- run container
```
docker run --privileged -d -i -t -h 'lb' --name 'lb.sample' nginx-lb:latest
```
