FROM postgres:11

MAINTAINER xzlzx (307871680@qq.com)

RUN apt-get -y update 
RUN apt-get -y install vim wget libkrb5-dev libssl-dev gcc make git
RUN apt-get -y install postgresql-server-dev-11 build-essential
RUN apt-get -y install libncurses5-dev libncursesw5-dev libreadline6-dev
RUN apt-get -y install libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev
RUN apt-get -y install libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev
RUN apt-get -y install ca-certificates
RUN apt-get -y install python3 python3-pip
RUN apt-get -y install postgresql-11-mysql-fdw postgresql-plpython3-11
RUN apt-get -y install postgresql-11-postgis-2.5 postgresql-11-cron
RUN wget http://www.xunsearch.com/scws/down/scws-1.2.3.tar.bz2 && \
   tar xvf scws-1.2.3.tar.bz2 && \
   cd scws-1.2.3 && \
   ./configure && \
   make install && \
   git clone https://github.com/amutu/zhparser.git && \
   cd zhparser && make && make install && \
  wget https://codeload.github.com/postgrespro/pg_pathman/tar.gz/1.5.2-4 && \
  tar -xvzf 1.5.2-4 && \
  cd pg_pathman-1.5.2-4 && make USE_PGXS=1 && make USE_PGXS=1 install && \
  cd .. && rm -R pg_pathman-1.5.2-4 && \
  rm -rf /var/lib/apt/lists/* && \
  apt-get autoremove && apt-get clean
  
