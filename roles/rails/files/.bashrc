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
