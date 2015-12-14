- build container
```
docker build -t centos7phpbrew:latest .
```
- run container
```
docker run --privileged -d -i -p 80:80 -t -h "cent7phpbrew" --name "cent7phpbrew.sample" centos7phpbrew:latest 
```
