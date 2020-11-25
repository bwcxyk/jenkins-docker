# jenkins-docker

包含 apache-maven-3.6.2，node-v12.13.1，docker

maven目录 `/usr/local/maven`

nodejs目录 `/usr/local/node`

```
docker run \
  -u root \
  --rm \  
  -d \ 
  -p 8080:8080 \ 
  -p 50000:50000 \ 
  -v jenkins-data:/var/jenkins_home \ 
  -v /var/run/docker.sock:/var/run/docker.sock \ 
  yaokun/jenkins
```
