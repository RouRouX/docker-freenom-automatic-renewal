# freenom-automatic-renewal（免费域名自动续期）
[![GitHub Stars](https://img.shields.io/github/stars/RouRouX/docker-freenom-automatic-renewal.svg?style=flat-square&label=Stars&logo=github)](https://github.com/RouRouX/docker-freenom-automatic-renewal/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/RouRouX/docker-freenom-automatic-renewal.svg?style=flat-square&label=Forks&logo=github)](https://github.com/RouRouX/docker-freenom-automatic-renewal/fork)
[![Docker Stars](https://img.shields.io/docker/stars/rouroux/freenom-automatic-renewal.svg?style=flat-square&label=Stars&logo=docker)](https://hub.docker.com/r/rouroux/freenom-automatic-renewal)
[![Docker Pulls](https://img.shields.io/docker/pulls/rouroux/freenom-automatic-renewal.svg?style=flat-square&label=Pulls&logo=docker)](https://hub.docker.com/r/rouroux/freenom-automatic-renewal) [![GitHub license](https://img.shields.io/github/license/RouRouX/docker-freenom-automatic-renewal.svg?style=flat-square&label=LICENSE)](https://github.com/RouRouX/docker-freenom-automatic-renewal/blob/master/LICENSE)


## 执行命令：

默认命令
```
docker run -d --name freenom -v <path to config>:/conf rouroux/freenom-automatic-renewal
```

自定义脚本执行时间（每天早上9点）
```
docker run -d --name freenom -e CRON="00 09 * * *" -v <path to config>:/conf rouroux/freenom-automatic-renewal
```

## 支持环境：
`linux/amd64`、`linux/arm/v6`、`linux/arm/v7`、`linux/arm64`、`linux/386`、`linux/ppc64le`、`linux/s390x`

（VPS、群晖、各种派应该都行）

## 简单说明：

第一次运行容器会在数据卷中建立两个配置文件config.php和.env

修改.env中的freenom的账号信息和邮箱信息，重启容器即可收到邮件，每次启动容器都会执行一次，每天早上9点也会运行一次。

如果想改成只有续期成功才发邮件，修改.env中NOTICE_FREQ=0

其它配置参数说明查看[项目地址](https://github.com/luolongfei/freenom)

## 最近一次更新：

2021年5月20日

* 支持自定义执行时间
* 基于 [luolongfei/freenom](https://github.com/luolongfei/freenom/tree/72e526c2681a07a3ffbfe4f32368b7653989bcf4) 制作镜像

更早的更新记录就不写了...


## 鸣谢：

[luolongfei/freenom](https://github.com/luolongfei/freenom) PHP自动续期脚本项目地址

[oldiy/freenom-automatic-renewal](https://hub.docker.com/r/oldiy/freenom-automatic-renewal) 基于上面脚本的docker镜像地址（此作者很久没更新了，所以才自己写了）

