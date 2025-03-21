FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y php php-mysql php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip mariadb-server mariadb-client
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY tools/scriptdb.sh /usr/local/bin/.

RUN mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod 777 /var/run/mysqld

RUN chmod +x /usr/local/bin/scriptdb.sh


ENTRYPOINT [ "/usr/local/bin/scriptdb.sh" ]
CMD [ "/usr/bin/mysqld_safe" ]

EXPOSE 3306
