# freenom-automatic-renewal（免费域名自动续期）
[![Docker Pulls](https://img.shields.io/docker/pulls/rouroux/freenom-automatic-renewal.svg)](https://hub.docker.com/r/rouroux/freenom-automatic-renewal) [![GitHub license](https://img.shields.io/github/license/RouRouX/docker-freenom-automatic-renewal)](https://github.com/RouRouX/docker-freenom-automatic-renewal/blob/master/LICENSE)


## 执行命令：

```
docker run -d --name freenom -v <path to config>:/conf rouroux/freenom-automatic-renewal
```

## 简单说明：

第一次运行容器会在数据卷中建立两个配置文件config.php和.env

修改.env中的freenom的账号信息和邮箱信息，重启容器即可收到邮件，每次启动容器都会执行一次，每天早上9点也会运行一次。

如果想改成只有续期成功才发邮件，修改config.php中'noticeFreq' => 0

详细配置说明查看[项目地址](https://github.com/luolongfei/freenom)


## 鸣谢

[luolongfei/freenom](https://github.com/luolongfei/freenom) PHP自动续期脚本

[oldiy/freenom-automatic-renewal](https://hub.docker.com/r/oldiy/freenom-automatic-renewal) 基于上面脚本的docker镜像（此作者很久没更新了，所以才自己写了）

