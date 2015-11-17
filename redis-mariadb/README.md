- build container
```
docker build -t redis-mariadb:latest .
```

- run container
```
docker run --privileged -d -i -p 3306:3306 -p 6379:6379 -t -h 'redis-mariadb' --name 'redis-mariadb.sample' redis-mariadb:latest
```
#!/bin/bash

