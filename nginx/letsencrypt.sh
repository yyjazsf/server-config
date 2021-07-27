curl  https://get.acme.sh | sh -s email=admin@yingyj.com

alias acme.sh=~/.acme.sh/acme.sh
acme.sh  --upgrade  --auto-upgrade

# https://ak-console.aliyun.com/#/accesskey
# export Ali_Key=""
# export Ali_Secret=""
acme.sh  --issue -d yingyj.com  -d '*.yingyj.com'  --dns dns_ali

cd ~/.acme.sh/

acme.sh --install-cert -d yingyj.com \
--key-file       /etc/nginx/ssl/yingyj.com/key.pem  \
--fullchain-file /etc/nginx/ssl/yingyj.com/fullchain.pem \
--reloadcmd     "service nginx force-reload"
