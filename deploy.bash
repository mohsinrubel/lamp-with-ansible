#!/bin/bash

set -e
set -x

ansible-playbook -i inventory.ini  lamp_setup.yml 
