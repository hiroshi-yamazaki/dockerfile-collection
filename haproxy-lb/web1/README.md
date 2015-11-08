- build container
```
docker build -t nginx-web1:latest .
```
- run container
```
docker run --privileged -d -i -t -h 'web1' --name 'web1.sample' nginx-web1:latest 
```
