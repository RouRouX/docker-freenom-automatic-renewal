# freenom-automatic-renewal（免费域名自动续期）
[![GitHub Stars](https://img.shields.io/github/stars/RouRouX/docker-freenom-automatic-renewal.svg?style=flat-square&label=Stars&logo=github)](https://github.com/RouRouX/docker-freenom-automatic-renewal/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/RouRouX/docker-freenom-automatic-renewal.svg?style=flat-square&label=Forks&logo=github)](https://github.com/RouRouX/docker-freenom-automatic-renewal/fork)
[![Docker Stars](https://img.shields.io/docker/stars/rouroux/freenom-automatic-renewal.svg?style=flat-square&label=Stars&logo=docker)](https://hub.docker.com/r/rouroux/freenom-automatic-renewal)
[![Docker Pulls](https://img.shields.io/docker/pulls/rouroux/freenom-automatic-renewal.svg?style=flat-square&label=Pulls&logo=docker)](https://hub.docker.com/r/rouroux/freenom-automatic-renewal) [![GitHub license](https://img.shields.io/github/license/RouRouX/docker-freenom-automatic-renewal.svg?style=flat-square&label=LICENSE)](https://github.com/RouRouX/docker-freenom-automatic-renewal/blob/master/LICENSE)


### 🐳 老司机直奔主题

> 如何部署？

```shell
docker run -d --name freenom --restart always -v $(pwd):/conf -v $(pwd)/logs:/app/logs rouroux/freenom-automatic-renewal
```

或者，如果你想自定义脚本执行时间，则命令如下

```shell
docker run -d --name freenom --restart always -v $(pwd):/conf -v $(pwd)/logs:/app/logs -e RUN_AT="11:24" rouroux/freenom-automatic-renewal
```

> 如何升级到最新版或者重新部署呢？

在`.env`所在目录，执行`docker rm -f freenom`删除现有容器，然后再执行 `docker rmi -f rouroux/freenom-automatic-renewal`
删除旧的镜像，然后再执行上面的 `docker run -d --name freenom --restart always -v $(pwd):/conf -v $(pwd)/logs:/app/logs rouroux/freenom-automatic-renewal`
重新部署即可，这样部署后就是最新的代码了。当然，新版对应的`.env`文件可能有变动，不必担心，程序会自动更新`.env`文件内容，并将已有的配置迁移过去。

一句话操作，即在`.env`文件所在目录下执行以下命令，即可完成更新升级：

```shell
docker rm -f freenom && docker rmi -f rouroux/freenom-automatic-renewal && docker run -d --name freenom --restart always -v $(pwd):/conf -v $(pwd)/logs:/app/logs rouroux/freenom-automatic-renewal
```


### 🐳 新司机通过 Docker 部署详细教程

*如果你有自己的服务器，这是最推荐的部署方式。*

Docker 仓库地址为： [https://hub.docker.com/r/rouroux/freenom-automatic-renewal](https://hub.docker.com/r/rouroux/freenom-automatic-renewal) 。
此镜像支持的架构为`linux/amd64`，`linux/arm64`，`linux/ppc64le`，`linux/s390x`，`linux/386`，`linux/arm/v7`，`linux/arm/v6`， 理论上支持`群晖`
、`威联通`、`树莓派`以及各种类型的`VPS`。

#### 1、安装 Docker

##### 1.1 以 root 用户登录，执行一键脚本安装 Docker

升级源并安装软件（下面两行命令二选一，根据你自己的系统）

Debian / Ubuntu

```shell
apt-get update && apt-get install -y wget vim
```

CentOS

```shell
yum update && yum install -y wget vim
```

执行此命令等候自动安装 Docker

```shell
wget -qO- get.docker.com | bash
```

说明：请使用 KVM 架构的 VPS，OpenVZ 架构的 VPS 不支持安装 Docker，另外 CentOS 8 不支持用此脚本来安装 Docker。 更多关于 Docker
安装的内容参考 [Docker 官方安装指南](https://docs.docker.com/engine/install/) 。

##### 1.2 针对 Docker 执行以下命令

启动 Docker 服务

```shell
systemctl start docker
```

查看 Docker 运行状态

```shell
systemctl status docker
```

将 Docker 服务加入开机自启动

```shell
systemctl enable docker
```

#### 2、通过 Docker 部署域名续期脚本

##### 2.1 用 Docker 创建并启动容器

命令如下

```shell
docker run -d --name freenom --restart always -v $(pwd):/conf -v $(pwd)/logs:/app/logs rouroux/freenom-automatic-renewal
```

或者，如果你想自定义脚本执行时间，则命令如下

```shell
docker run -d --name freenom --restart always -v $(pwd):/conf -v $(pwd)/logs:/app/logs -e RUN_AT="11:24" rouroux/freenom-automatic-renewal
```

上面这条命令只比上上条命令多了个` -e RUN_AT="11:24"`，其中`11:24`表示在北京时间每天的 11:24 执行续期任务，你可以自定义这个时间。 这里的`RUN_AT`参数同时也支持 CRON
命令里的时间形式，比如，` -e RUN_AT="9 11 * * *"`，表示每天北京时间 11:09 执行续期任务， 如果你不想每天执行任务，只想隔几天执行，只用修改`RUN_AT`的值即可。

**注意：不推荐自定义脚本执行时间。因为你可能跟很多人定义的是同一个时间点，这样可能导致所有人都是同一时间向 Freenom 的服务器发起请求， 使得 Freenom 无法稳定提供服务。而如果你不自定义时间，程序会自动指定北京时间 06 ~
23 点全时段随机的一个时间点作为执行时间， 每次重启容器都会自动重新指定。**

<details>
    <summary>点我查看上方 Docker 命令的参数解释</summary>
<br>

| 命令 | 含义 |
| :--- | :--- |
| docker run | 开始运行一个容器 |
| -d 参数 | 容器以后台运行并输出容器 ID |
| --name 参数 | 给容器分配一个识别符，方便将来的启动，停止，删除等操作 |
| --restart 参数 | 配置容器启动类型，always 即为 docker 服务重新启动时自动启动本容器 |
| -v 参数 | 挂载卷（volume），冒号后面是容器的路径，冒号前面是宿主机的路径（只支持绝对路径），`$(pwd)`表示当前目录，如果是 Windows 系统，则可用`${PWD}`替换此处的`$(pwd)` |
| -e 参数 | 指定容器中的环境变量 |
| rouroux/freenom-automatic-renewal | 这是从 docker hub 下载回来的镜像完整路径名 |

</details>

至此，你的自动续期容器就跑起来了，执行`ls -a`后你就可以看到在你的当前目录下，有一个`.env`文件和一个`logs`目录，`logs`目录里面存放的是程序日志， 而`.env`则是配置文件，现在直接执行`vim .env`
将`.env`文件里的所有配置项改为你自己的并保存即可。然后重启容器，如果配置正确的话，便很快可以收到相关邮件。

<details>
    <summary>点我查看 .env 文件中部分配置项的含义</summary>
<br>

| 变量名 | 含义 | 默认值 | 是否必须 |                                             备注                                              |
| :---: | :---: |:---:|:----:|:-------------------------------------------------------------------------------------------:|
| FREENOM_USERNAME | Freenom 账户 |  -  |  是   |                只支持邮箱账户，如果你是使用第三方社交账户登录的用户，请在 Freenom 管理页面绑定邮箱，绑定后即可使用邮箱账户登录                 |
| FREENOM_PASSWORD | Freenom 密码 |  -  |  是   |                                 某些特殊字符可能需要转义，详见`.env`文件内注释                                  |
| MULTIPLE_ACCOUNTS | 多账户支持 |  -  |  否   |                                 多个账户和密码的格式必须是“`<账户1>@<密码1>\|<账户2>@<密码2>\|<账户3>@<密码3>`”，注意不要省略“<>”符号，否则无法正确匹配。如果设置了多账户，上面的`FREENOM_USERNAME`和`FREENOM_PASSWORD`可不设置 |
| MAIL_USERNAME | 机器人邮箱账户 |  -  |  否   |                            支持`Gmail`、`QQ邮箱`、`163邮箱`以及`Outlook邮箱`                            |
| MAIL_PASSWORD | 机器人邮箱密码 |  -  |  否   |                              `Gmail`填应用专用密码，`QQ邮箱`或`163邮箱`填授权码                              |
| TO | 接收通知的邮箱 |  -  |  否   |                                你自己最常用的邮箱，用来接收机器人邮箱发出的域名相关邮件                                 |
| MAIL_ENABLE | 是否启用邮件推送功能 | `0` |  否   | `1`：启用<br>`0`：不启用<br>默认不启用，如果设为`1`，启用邮件推送功能，则上面的`MAIL_USERNAME`、`MAIL_PASSWORD`、`TO`变量变为必填项 |
| TELEGRAM_CHAT_ID | 你的`chat_id` |  -  |  否   |                           通过发送`/start`给`@userinfobot`可以获取自己的`id`                            |
| TELEGRAM_BOT_TOKEN | 你的`Telegram bot`的`token` |  -  |  否   ||
| TELEGRAM_BOT_ENABLE | 是否启用`Telegram Bot`推送功能 | `0` |  否   |    `1`：启用<br>`0`：不启用<br>默认不启用，如果设为`1`，则必须设置上面的`TELEGRAM_CHAT_ID`和`TELEGRAM_BOT_TOKEN`变量     |
| NOTICE_FREQ | 通知频率 | `1` |  否   |                                 `0`：仅当有续期操作的时候<br>`1`：每次执行                                  |

**更多配置项含义，请参考 [.env.example](https://github.com/luolongfei/freenom/blob/main/.env.example) 文件中的注释。**

</details>

> 如何验证你的配置是否正确呢？
>

修改并保存`.env`文件后，执行`docker restart freenom`重启容器，等待 5 秒钟左右，然后执行`docker logs freenom`查看输出内容， 观察输出内容中有`执行成功`
字样，则表示配置无误。如果你还来不及配置送信邮箱等内容，可先停用邮件功能。

> 如何升级到最新版或者重新部署呢？
>

在`.env`所在目录，执行`docker rm -f freenom`删除现有容器，然后再执行 `docker rmi -f rouroux/freenom-automatic-renewal`
删除旧的镜像，然后再执行上面的 `docker run -d --name freenom --restart always -v $(pwd):/conf -v $(pwd)/logs:/app/logs rouroux/freenom-automatic-renewal`
重新部署即可，这样部署后就是最新的代码了。当然，新版对应的`.env`文件可能有变动，不必担心，程序会自动更新`.env`文件内容，并将已有的配置迁移过去。

一句话操作，即在`.env`文件所在目录下执行以下命令，即可完成更新升级：

```shell
docker rm -f freenom && docker rmi -f rouroux/freenom-automatic-renewal && docker run -d --name freenom --restart always -v $(pwd):/conf -v $(pwd)/logs:/app/logs rouroux/freenom-automatic-renewal
```

##### 2.2 后期容器管理以及 Docker 常用命令

查看容器在线状态及大小

```shell
docker ps -as
```

查看容器的运行输出日志

```shell
docker logs freenom
```

重新启动容器

```shell
docker restart freenom
```

停止容器的运行

```shell
docker stop freenom
```

移除容器

```shell
docker rm -f freenom
```

查看 docker 容器占用 CPU，内存等信息

```shell
docker stats --no-stream
```

查看 Docker 安装版本等信息

```shell
docker version
```

重启 Docker（非容器）

```shell
systemctl restart docker
```

*有关容器部署的内容结束。*

***

[更多参考原始项目说明](https://github.com/luolongfei/freenom#-%E9%80%9A%E8%BF%87-docker-%E9%83%A8%E7%BD%B2)

## 支持环境：
`linux/amd64`、`linux/arm/v6`、`linux/arm/v7`、`linux/arm64`、`linux/386`、`linux/ppc64le`、`linux/s390x`

（VPS、群晖、各种派应该都行）

## 最近一次更新：

2022年11月15日

* 基于 [luolongfei/freenom](https://github.com/luolongfei/freenom/) v0.5.1 制作镜像

更早的更新记录就不写了...

## 鸣谢：

[luolongfei/freenom](https://github.com/luolongfei/freenom) PHP自动续期脚本项目地址

最初原始项目还没有docker支持，才有了此镜像，现在原始项目已经支持了docker。本镜像随缘更新。

## Thanks for free JetBrains Open Source license

<a href="https://www.jetbrains.com/?from=docker-freenom-automatic-renewal" target="_blank">
<img src="https://user-images.githubusercontent.com/1787798/69898077-4f4e3d00-138f-11ea-81f9-96fb7c49da89.png" height="200"/></a>




