#!/bin/bash
echo `whoami`
sudo chmod +x /vagrant/start.sh
sudo -u stack /vagrant/start.sh
