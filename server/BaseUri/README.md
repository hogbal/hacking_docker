## Base Uri를 이용한 CSP 우회를 위한 서버

- docker build

```bash
docker build -t hogbal/hacking_tools:baseuri ./
```
- docker run

```bash
docekr run -d -p 8888:80 hogbal/hakcing_tools:baseuri
```
