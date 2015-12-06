- build container
```
docker build -t swift:latest .
```

- run container
```
docker run --privileged -d -i -t -h 'swift' --name 'swift.sample' swift:latest
```
