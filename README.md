# jenkins-docker

包含 apache-maven-3.6.2，node-v12.13.1，docker

maven目录 `/usr/local/maven`

nodejs目录 `/usr/local/node`

```bash
docker run -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -e TZ="Asia/Shanghai" \
  -e JAVA_OPTS="-Duser.timezone=Asia/Shanghai -Dsun.jnu.encoding=UTF-8 -Dfile.encoding=UTF-8" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /data/jenkins-data:/data/jenkins \
  --restart=always \
  --privileged=true \
  --name jenkins \
  yaokun/jenkins:latest
```
