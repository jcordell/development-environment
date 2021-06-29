source ~/.bash_aliases

export JAVA_HOME=$(/usr/libexec/java_home -v11)

export PATH=${PATH}:/usr/bin/python3

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# AWS CLI
export PATH=/usr/local/bin:$PATH

# Don't let pressing delete key close terminal window
export IGNOREEOF=10

# ALIAS's

# mesos
alias swr="sbt web/run"

# get the pid of the process listening on a port
pidportfunction() {
lsof -n -i4TCP:$1 | grep LISTEN
}
 
alias pidport=pidportfunction

export EDITOR=vim

# git autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi


