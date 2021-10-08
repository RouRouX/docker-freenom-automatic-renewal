# freenom-automatic-renewal（免费域名自动续期）
[![GitHub Stars](https://img.shields.io/github/stars/RouRouX/docker-freenom-automatic-renewal.svg?style=flat-square&label=Stars&logo=github)](https://github.com/RouRouX/docker-freenom-automatic-renewal/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/RouRouX/docker-freenom-automatic-renewal.svg?style=flat-square&label=Forks&logo=github)](https://github.com/RouRouX/docker-freenom-automatic-renewal/fork)
[![Docker Stars](https://img.shields.io/docker/stars/rouroux/freenom-automatic-renewal.svg?style=flat-square&label=Stars&logo=docker)](https://hub.docker.com/r/rouroux/freenom-automatic-renewal)
[![Docker Pulls](https://img.shields.io/docker/pulls/rouroux/freenom-automatic-renewal.svg?style=flat-square&label=Pulls&logo=docker)](https://hub.docker.com/r/rouroux/freenom-automatic-renewal) [![GitHub license](https://img.shields.io/github/license/RouRouX/docker-freenom-automatic-renewal.svg?style=flat-square&label=LICENSE)](https://github.com/RouRouX/docker-freenom-automatic-renewal/blob/master/LICENSE)


## 如何以docker方式运行：

命令如下
```shell
$ docker run -d --name freenom --restart always -v $(pwd):/conf -v $(pwd)/logs:/app/logs rouroux/freenom-automatic-renewal
```
或者，如果你想自定义脚本执行时间，则命令如下
```shell
$ docker run -d --name freenom --restart always -v $(pwd):/conf -v $(pwd)/logs:/app/logs -e RUN_AT="11:24" rouroux/freenom-automatic-renewal
```
 上面这条命令只比上上条命令多了个` -e RUN_AT="11:24"`，其中`11:24`表示在北京时间每天的 11:24 执行续期任务，你可以自定义这个时间。
 这里的`RUN_AT`参数同时也支持 CRON 命令里的时间形式，比如，` -e RUN_AT="9 11 * * *"`，表示每天北京时间 11:09 执行续期任务，
 如果你不想每天执行任务，只想隔几天执行，只用修改`RUN_AT`的值即可。
 
 **注意：不推荐自定义脚本执行时间。因为你可能跟很多人定义的是同一个时间点，这样可能导致所有人都是同一时间向 Freenom 的服务器发起请求，
 使得 Freenom 无法稳定提供服务。而如果你不自定义时间，程序会自动指定北京时间 06 ~ 23 点全时段随机的一个时间点作为执行时间，
 每次重启容器都会自动重新指定。**

[更多参考项目说明](https://github.com/luolongfei/next-freenom#--%E6%96%B9%E5%BC%8F%E4%B8%80%E9%80%9A%E8%BF%87-docker-%E9%83%A8%E7%BD%B2%E6%9C%80%E7%AE%80%E5%8D%95%E7%9A%84%E6%96%B9%E5%BC%8F)

## 支持环境：
`linux/amd64`、`linux/arm/v6`、`linux/arm/v7`、`linux/arm64`、`linux/386`、`linux/ppc64le`、`linux/s390x`

（VPS、群晖、各种派应该都行）

## 最近一次更新：

2021年10月8日

* 修改源仓库
* 基于 [luolongfei/next-freenom](https://github.com/luolongfei/next-freenom/tree/4769df2745d55665a1ef2f860ec4dd8a4d3e422b) 制作镜像

更早的更新记录就不写了...


## 鸣谢：

[luolongfei/freenom](https://github.com/luolongfei/next-freenom) PHP自动续期脚本项目地址


