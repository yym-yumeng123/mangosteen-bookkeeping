# README

运行rails

oh-my-env docker 环境

运行数据库

```
docker run -d --name db-for-mangosteen -e POSTGRES_USER=mangosteen   -e POSTGRES_PASSWORD=123456 -e POSTGRES_DB=mangosteen_dev -e PGDATA=/var/lib/postgresql/data/pgdata -v mangosteen-data:/var/lib/postgresql/data --network=network1 postgres:14
```

docker: db-for-managosteen 数据库