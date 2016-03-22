sudo rm -r /etc/nginx/sites-enabled/default
sudo ﻿ln -sf /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart

sudo ln -s /home/box/web/etc/gunicorn.conf   /etc/gunicorn.d/test
sudo ln -s /home/box/web/etc/gunicorn_ask.conf /etc/gunicorn.d/ask
sudo /etc/init.d/gunicorn restart

sudo /etc/init.d/mysql restart
mysql -uroot -e "CREATE DATABASE ASK"
mysql -uroot -e "CREATE USER 'moof'@'localhost' IDENTIFIED BY '1234'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON ASK.* TO 'moof'@'localhost'"
/home/box/web/ask/manage.py syncdb
