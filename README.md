# kuber-wordpress
thise code help you create wordpress in minikube k8s clucter

1) для того, чтобы данные хранились за пределами pod создами директории для pv. <br>
```ssh minikube 
mkdir /mnt/data/wordpress
mkdir /mnt/data/mariadb
```
2) необходимо сделать внутри mariadb pod, чтобы создать базу данных.
```commandline
mysql 

CREATE DATABASE wordpress;
CREATE USER 'wp_user'@'%' IDENTIFIED BY 'wp_pass';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'%';
FLUSH PRIVILEGES;

exit
```
3) после, чтобы сохранить в pv данные mariadb. Проследите, чтобы у вас была раскоментированная строка с  "mountPath: /var/lib/mysql-mnt", а другая закоментирована.
```commandline
cp -a /var/lib/mysql/* /var/lib/mysql-mnt
chown -R mysql:mysql /var/lib/mysql-mnt
```
теперь мы можем ставить обратно первоначальную строку с коментарием.<br>
4) приступим к заполнению wp-config-sample.php для этого зайдите в pod c apache2. <br>
Либо самостоятельно заполните данные:
<br>wordpress - имя таблицы
<br>wp_user - имя пользователя
<br>wp_pass - пароль пользователя
<br>headless-statfulset - сервис для подключения к mariadb
<br>В конце переименуйте wp-config-sample.php в wp-config.php
<br>либо заполните все данные на сайте и удалите wp-config-sample.php
<br>Теперь мы готовы копировать данные в pv.
5) после, чтобы сохранить в pv данные wp. Проследите, чтобы у вас была раскоментированная строка с  "mountPath: /var/www/html-mnt", а другая закоментирована.
```commandline
cp -a /var/www/html/* /var/www/html-mnt
chown -R www-data:www-data /var/www/html-mnt
```
теперь мы можем ставить обратно первоначальную строку с коментарием.<br>
6) теперь осталось только сделать кластер ingress, который будет заниматься перенаправлением. 
```
minikube addons enable ingress
```
7) так же нужно прописать этот домен к ip minikube (minikube ip - покажет адресс.)
8) запустите все копоненты с помощью скрипта ./run.sh
