#! /bin/bash
version='7.0.75'
cd /www/activiti && wget http://mirrors.ustc.edu.cn/apache/tomcat/tomcat-7/v7.0.75/bin/apache-tomcat-$version.tar.gz
tar zxf apache-tomcat-$version.tar.gz && cd apache-tomcat-$version.tar.gz/webapps && rm -rf docs && rm -rf examples