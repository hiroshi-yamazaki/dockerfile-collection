docker build -t piyo:latest .

docker -d -i -p 20022:22 -p 3306:3306 -p 6379:6379 -t piyo:latest 
