source ~/.bash_aliases
source ~/.bash_profile

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Don't let pressing delete key close terminal window
export IGNOREEOF=10

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

# Git branch in name
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
function parse_git_needs_push {
    [[ $(git status 2> /dev/null) =~ .*(publish|different).* ]] && echo -e "\xE2\x86\x91"
}
function parse_git_needs_pull {
  [[ $(git status 2> /dev/null) =~ .*(behind|different).* ]] && echo -e "\xE2\x86\x93"
}
function parse_git_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_needs_pull)$(parse_git_needs_push)$(parse_git_dirty)]/"
}
setopt PROMPT_SUBST # this enables the parse_git_branch function to be called
export PS1='%n@%m %F{yellow}%1~%f %F{cyan}$(parse_git_branch)%f$ '

eval $(thefuck --alias)
