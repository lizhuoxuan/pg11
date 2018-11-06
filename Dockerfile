FROM postgres:11

MAINTAINER xzlzx (307871680@qq.com)


RUN apt-get -y update 
RUN apt-get -y install vim wget libkrb5-dev libssl-dev gcc make
RUN apt-get -y install postgresql-server-dev-11
RUN apt-get -y install postgresql-11-plv8 postgresql-11-mysql-fdw postgresql-plpython3-11
RUN wget https://github.com/postgrespro/pg_pathman/archive/1.5.2.tar.gz && \
  tar -xvzf 1.5.2.tar.gz && \
  cd pg_pathman-1.5.2 && make USE_PGXS=1 && make USE_PGXS=1 install && \
  cd .. && rm -R pg_pathman-1.5.2 && \
  rm -rf /var/lib/apt/lists/*
