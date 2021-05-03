#cd /usr/share/nomadic

redis-cli LPUSH SEED `cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1`
redis-cli SET COMMIT `git log --format="%h" -n 1`



if [[ "$USER" == 'root' ]]; then
	export PORT=80;
else
    if [[ ! -z "$PORT" ]]; then
	export PORT=8080;
    fi
fi

ruby exe/shell.rb $*
