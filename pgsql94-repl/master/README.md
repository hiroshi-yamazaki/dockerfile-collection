- build container
```
docker build -t pgsql94master:latest .
```

- run container
```
docker run --privileged -d -i -p 15432:5432 -t -h 'pgsql94master' --name 'pgsql94master.sample' pgsql94master:latest
```
