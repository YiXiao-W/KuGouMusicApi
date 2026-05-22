#!/bin/bash

NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm use v20.11.1

case "${1}" in
    start)
        if ! command -v pm2 &> /dev/null
        then
            echo "PM2 未安装，正在安装..."
            npm install pm2 -g
        fi
        npm install pm2 -g && pm2 start "npm run dev" --name dev
    ;;
    status)
        pm2 status  # 查看运行状态
    ;;
    stop)
        pm2 stop dev    # 停止运行
        pm2 delete dev
    ;;
    delete)
        pm2 delete dev    # 删除dev进程
    ;;
    logs)
        pm2 logs dev    # 查看运行日志
    ;;
    *)
        echo "default (none of above)"
    ;;
esac

