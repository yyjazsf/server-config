curl  https://get.acme.sh | sh -s email=admin@yingyj.com

alias acme.sh=~/.acme.sh/acme.sh
acme.sh  --upgrade  --auto-upgrade

# https://ak-console.aliyun.com/#/accesskey
# export Ali_Key=""
# export Ali_Secret=""
acme.sh --issue --dns dns_ali \
    -d yingyj.com -d "*.yingyj.com" \
    -d codecloud.icu -d "*.codecloud.icu"

cd ~/.acme.sh/

acme.sh --install-cert -d yingyj.com \
--key-file       /mnt/1725a/appdata/nginx/ssl/yingyj.com/key.pem  \
--fullchain-file /mnt/1725a/appdata/nginx/ssl/yingyj.com/fullchain.pem \
--reloadcmd     "service nginx force-reload"
