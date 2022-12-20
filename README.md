# README

### ruby-china 源

```bash
bundle config mirror.https://rubygems.org https://gems.ruby-china.com
```

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

1. curl

```bash
curl -X POST http://127.0.0.1:3000/api/v1/validation_codes  # post
-H 'Content-type: aplication/json' # 添加请求头
-d {"amount": 99} # 添加消息体


curl -X POST http://127.0.0.1:3000/api/v1/items
curl -v http://127.0.0.1:3000/api/v1/items # get
```

2. postman 等工具
3. 写测试用例
```bash
rails generate --help | grep rspec  # rspec 常用命令

$ bundle binstubs rspec-core
bin/rspec

bin/rake docs:generate # 生成 api
```