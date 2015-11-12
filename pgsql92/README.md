- build container
```
docker build -t pgsql92:latest .
```

- run container
```
docker run --privileged -d -i -p 5432:5432 -t -h 'pgsql92' --name 'pgsql92.sample' pgsql92:latest
```
