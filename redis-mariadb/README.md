- build container
```
docker build -t piyo:latest .
```

- run container
```
docker run -d -i -p 3306:3306 -p 6379:6379 -p 20022:22 -t piyo:latest
```
