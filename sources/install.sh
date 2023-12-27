#!/usr/bin/env bash

mysql -h mysql -u root -proot -e "CREATE DATABASE IF NOT EXISTS project_b_dev_task" && \
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
export NVM_DIR="/home/root/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

cd /var/www/vhosts/project-b.localhost/api && npm install && npm run migrate && npm run db:seed && pm2 start pm2.json
