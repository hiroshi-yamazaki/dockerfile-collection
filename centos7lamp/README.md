- build container
```
docker build -t piyo:latest .
```
- run container
```
docker run --privileged -d -i -p 20022:22 -p 3306:3306 -p 80:80 -t piyo:latest 
```
