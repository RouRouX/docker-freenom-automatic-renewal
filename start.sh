#!/bin/sh
# 如果两个配置文件不存在，从备份中复制一波到数据卷中
if [ ! -f /conf/config.php ]; then
	cp /confbak/config.php /conf/config.php
fi
if [ ! -f /conf/.env ]; then
	cp /confbak/.env /conf/.env
fi
# 下面是软连接，源-目标，如果实际没有那么创建软连接
if [ ! -f /freenom/config.php ]; then
	ln -s /conf/config.php /freenom/config.php
fi
if [ ! -f /freenom/.env ]; then
	ln -s /conf/.env /freenom/.env
fi
cd /freenom/
php run
crond
#防止sh执行完自动退出
php -a
