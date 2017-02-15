#! /bin/bash
mkdir activiti-rest
mkdir activiti-explorer

cd activiti-rest && wget http://77fkx4.com1.z0.glb.clouddn.com/activiti-rest.war && jar xf activiti-rest.war && rm -f activiti-rest.war
cd activiti-explorer && wget http://77fkx4.com1.z0.glb.clouddn.com/activiti-explorer.war && jar xf activiti-explorer.war && rm -f activiti-explorer.war

sed -i 's/create.demo.definitions=true/create.demo.definitions=false/g' /root/activiti-explorer/WEB-INF/classes/engine.properties
sed -i 's/create.demo.definitions=true/create.demo.definitions=false/g' /root/activiti-rest/WEB-INF/classes/engine.properties
