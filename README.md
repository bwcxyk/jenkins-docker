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
## 插件安装慢
进入jenkins目录
```
sed -i 's/https:\/\/updates.jenkins.io\/update-center.json/https:\/\/mirrors.tuna.tsinghua.edu.cn\/jenkins\/updates\/update-center.json/g' hudson.model.UpdateCenter.xml
```
进入updates目录
```
sed -i 's/http:\/\/updates.jenkins-ci.org\/download/https:\/\/mirrors.tuna.tsinghua.edu.cn\/jenkins/g' default.json
sed -i 's/http:\/\/www.google.com/https:\/\/www.baidu.com/g' default.json
```
重启jenkins容器
```
docker restart jenkins
```
若推送镜像时提示`Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock`
```
chmod 777 /var/run/docker.sock
```
