- build container
```
docker build -t centos7wp:latest .
```
- run container
```
docker run --privileged -d -i -p 20022:22 -p 3306:3306 -p 80:80 -t -h "cent7wp" --name "cent7wp.sample" centos7wp:latest 
```
