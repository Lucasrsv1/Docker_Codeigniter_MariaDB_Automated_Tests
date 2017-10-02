FROM ubuntu:14.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-client
ENV MYSQL_USER="root" MYSQL_PASSWORD=""

ADD ./scripts/*.sql /

# Use the following line ONLY when MYSQL_PASSWORD is empty:
#CMD sleep 50 && for file in /*.sql; do mysql -h 'mariadb' -u $MYSQL_USER -p$MYSQL_PASSWORD < $file; done

# Use the following line ONLY when MYSQL_PASSWORD is NOT empty:
CMD sleep 50 && for file in /*.sql; do mysql -h 'mariadb' -u $MYSQL_USER < $file; done