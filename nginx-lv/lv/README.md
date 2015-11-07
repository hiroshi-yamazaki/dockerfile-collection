- build container
```
docker build -t nginx-lv:latest .
```
- run container
```
docker run --privileged -d -i -t -h 'lv' --name 'lv.sample' nginx-lv:latest
```
