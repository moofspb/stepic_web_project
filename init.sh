mysql -uroot -e "CREATE DATABASE qa"
mysql -uroot -e "CREATE USER 'moof'@'localhost' IDENTIFIED BY 'qapass';
                 GRANT ALL ON qa.* TO 'moof'@'localhost';"

sudo python /home/box/web/ask/manage.py syncbd

sudo rm -r /etc/nginx/sites-enabled/default.conf
sudo ﻿/bin/ln -sf /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart

sudo rm -r /etc/gunicorn.d/*
sudo /bin/ln -sf /home/box/web/etc/hello.py  /etc/gunicorn.d/hello.py
sudo /bin/ln -sf /home/box/web/etc/qa.py  /etc/gunicorn.d/qa.py
sudo /etc/init.d/gunicorn restart
