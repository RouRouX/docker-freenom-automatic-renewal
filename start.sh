#!/bin/sh
# 如果文件/conf/config.php不存在，复制一波
if [ ! -f /conf/config.php ]; then
	cp /confbak/config.php /conf/config.php
fi
if [ ! -f /conf/.env ]; then
	cp /confbak/.env /conf/.env
fi
# 下面是软连接，源-目标
ln -s /conf/config.php /freenom/config.php
ln -s /conf/.env /freenom/.env
cd /freenom/
php index.php
crond
#php -a
