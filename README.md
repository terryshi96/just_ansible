# simple-ansible-playbooks
simple ansible playbooks for rails\postgresql\node\redis\zabbix_agent\docker etc.


# install ansible
- pip install ansible
- pip install passlib
- ssh-keygen -t rsa


##roles
include common docker elk nodejs postgresql rails redis zabbix_agent

##usage


- first of all you should add your public key to servers
- add connect information to file hosts and push ssh key
```
ansible-playbook ssh.yml
```
- edit a playbook file like site.yml and choose roles and hosts
- execute playbook
```
ansible-playbook site.yml
```

