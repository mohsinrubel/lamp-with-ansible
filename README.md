# ✅ Project Title: Deploy lamp(php with mysql) Project In Linux Machine Using Ansible
this project create simple lamp application that configure simple lamp application and setup lamp environment using ansible 

## ✅ Step 1: Create VM 
Create an Virtual Machine (ubuntu 22.04)  in aws, azure  or your custom vm or vps.

## ✅ Step 2: Configure ansible Host
 Configure `` inventory.ini `` for hsot and give uour machine ip and access key
 ```
[ec2_vm]
<your_ip>  ansible_ssh_user=<vm_usr_name> ansible_ssh_private_key_file=<your private_key_path>
```

## ✅ Step 3: Configure Playbook

 ☑️ Here configure plabook for setup lamp and copy project and configure database
 
 ```
---
- name: Deploy static web application
  hosts: ec2_vm
  become: true
  tasks:
    - name: Update apt cache
      apt:
        update_cache: yes

    - name: Install Apache
      apt:
        name: apache2
        state: present

    - name: Install MySQL Server
      apt:
        name: mysql-server
        state: present

    - name: Install PHP
      apt:
        name: php
        state: present

    - name: Install MySQL client
      apt:
        name: mysql-client
        state: present

    - name: Ensure MySQL service is started
      systemd:
        name: mysql
        enabled: yes
        state: started

    - name: Copy database dump to the remote host
      copy:
        src: ./lamp-app/simple_lamp.sql
        dest: /tmp/simple_lamp.sql

    - name: Import MySQL database
      command: "mysql -u root  simple_lamp < /tmp/simple_lamp.sql"

    - name: Copy application files
      copy:
        src: ./lamp-app/
        dest: /var/www/html/
        owner: www-data
        group: www-data

```

## ✅ Step 4: Run Application

☑️ Run playbook `` ./deploy.sh `` command.

## ✅ Step 5: Update application

☑️ update code and run ☑️ Run playbook `` ./deploy.sh `` command.

## ✅ Conclsion: 
We used ansible and linux VM . This gave us a strong base for our deployment. After that, we update application just run playbook.
