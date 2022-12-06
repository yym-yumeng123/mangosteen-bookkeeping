# README

### 创建项目

```bash
rails new --api --database=postgresql --skip-test ProjectName
```

运行rails

oh-my-env docker 环境

运行数据库

```bash
# 容器名字 --name db-for-mangosteen
# -v 新增一个数据卷
docker run -d --name db-for-mangosteen -e POSTGRES_USER=mangosteen   -e POSTGRES_PASSWORD=123456 -e POSTGRES_DB=mangosteen_dev -e PGDATA=/var/lib/postgresql/data/pgdata -v mangosteen-data:/var/lib/postgresql/data --network=network1 postgres:14
```

### Reopen in container 报错，怎么办

1. 卸载 vscode 的 dev container 插件

2. 
```bash
code --install-extension ms-vscode-remote.remote-containers@0.251.0
```


### 接口调试

```bash
curl -X POST http://127.0.0.1:3000/api/v1/validation_codes  # post
curl -X POST http://127.0.0.1:3000/api/v1/items
curl -v http://127.0.0.1:3000/api/v1/items # get
```