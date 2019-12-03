#!/bin/bash
sudo setenforce 0
sudo yum -y update
sudo yum -y install wget
sudo yum -y install zip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --user
pip install "pywinrm>=0.3.0" --user
pip install "pywinrm>=0.3.0"[credssp] --user
pip install --user ansible
pip install --user pymssql
pip install --user pyOpenSSL
ansible-galaxy install kkolk.mssql
ansible-galaxy install ypsman.hosts
