- build container
```
docker build -t nginx-web2:latest .
```
- run container
```
docker run --privileged -d -i -t -h 'web2' --name 'web2.sample' nginx-web2:latest 
```
