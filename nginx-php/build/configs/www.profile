export PS1="\[\033[01;33m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "
export LANG=ru_RU.UTF-8
export TERM=xterm

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias rngx='sudo nginx -s reload'
alias rphp='sudo service php7.1-fpm restart'

alias cache-clr='rm -r -f /var/www/app/cache'
alias www='cd /var/www'
