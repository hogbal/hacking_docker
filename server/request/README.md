## XSS 기법을 이용할 때 cookie 탈취 도음 서버

- docker build

```bash
docker build -t hogbal/hacking_tools:request ./
```

- docker run

```bash
docker run -d -p 8888:8888 hogbal/hacking_tools:request
```

- 요청 주소 : http://[ip]:[port]/*
- 홈페이지 : http://[ip]:[port]/request_list
