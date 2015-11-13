- build container
```
docker build -t pgsql94:latest .
```

- run container
```
docker run --privileged -d -i -p 5432:5432 -t -h 'pgsql94' --name 'pgsql94.sample' pgsql94:latest
```