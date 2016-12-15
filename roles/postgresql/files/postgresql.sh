#! /bin/bash
release="9.5.5"
cd /opt && gunzip postgresql-$release.tar.gz && tar xf postgresql-$release.tar

cd /opt/postgresql-$release && ./configure --prefix=/opt/pgsql-$release && make && make install
cd /opt/postgresql-$release/contrib/pg_stat_statements && make && make install
cd /opt/ && ln -s pgsql-$release pgsql











