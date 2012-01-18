export PATH=/usr/local/share/python:/usr/local/bin:/usr/local/sbin:/usr/local/Cellar/python/2.7.1/bin:~/bin:~/.gem/ruby/1.8/bin:$PATH
export EDITOR="$HOME/bin/mate -w"
export LC_ALL=sv_SE.UTF-8
export LANG=sv_SE.UTF-8

if [ -f /usr/local/etc/bash_completion ]; then
      . /usr/local/etc/bash_completion
fi

export LS_OPTIONS='-G'
# eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias mkdir='mkdir -p'

source `which pycompletion`

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
source /usr/local/share/python/virtualenvwrapper.sh

dj() {
    python manage.py $1 --settings=settings_dev $2
}
djdump() {
    python manage.py dumpdata $1 > initial_data.json --settings=settings_dev --indent=4
}
alias djr='dj runserver 0.0.0.0:8000'
alias djs='dj syncdb'
alias djsh='dj shell'

has_virtualenv() {
    if [ -e .venv ]; then
        workon `cat .venv`
    fi
}
venv_cd () {
    cd "$@" && has_virtualenv
}
alias cd="venv_cd"
