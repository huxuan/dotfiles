
[ -f ~/.bashrc_common ] && . ~/.bashrc_common
[[ $HOSTNAME != *"huxuanorg"* && -f ~/.bashrc_client ]] && . ~/.bashrc_client
[[ -f ~/.bashrc_`uname` ]] && . ~/.bashrc_`uname`
