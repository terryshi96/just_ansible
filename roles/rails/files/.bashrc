# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
alias sb='source ~/.bashrc'
alias q='cd .. && ls'
alias al='qalias.sh'
alias rc='RAILS_ENV=production rails console'

function tlog() {
  if [ -f log/production.log ]; then
    tail -f log/production.log
  fi
}

function terr() {
  if [ -f log/error.log ]; then
    tail -f log/error.log
  fi
}


# User specific environment and startup programs
export LD_PRELOAD=/usr/lib64/libjemalloc.so.1
export PGPORT=5432
export PGDATA=/home/postgres/pgdata/data
export LANG=en_US.utf8
export PGHOME=/opt/pgsql
export LD_LIBRARY_PATH=$PGHOME/lib:/lib64:/usr/lib64:/usr/local/lib64:/lib:/usr/lib:/usr/local/lib:$LD_LIBRARY_PATH
export DATE=`date +"%Y%m%d%H%M"`
export PATH=$PGHOME/bin:$PATH:.
export MANPATH=$PGHOME/share/man:$MANPATH
export PGUSER=postgres
export PGHOST=$PGDATA
export PGDATABASE=postgres

PATH=$PATH:$HOME/bin

export PATH