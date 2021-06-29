ffg () {
  find . -type f | grep -i $1 2> /dev/null
}
mtime() {
  find . -type f -mtime $1 -print 2> /dev/null
}

jira () {
  branch="`git branch | grep "^\* " | cut -d' ' -f2 | cut -d'-' -f-2`"
  if [ "$branch" == "master" ]; then
    echo "wot"
  else
    open "https://jira.rallyhealth.com/browse/$branch"  
  fi
}


k8s () {
  aws-okta write-to-credentials connect-rally-dev ~/.aws/credentials
  aws-okta write-to-credentials care-rally-dev ~/.aws/credentials
  tenant=${1:-brave-dog}
  if [ "$1" != "dd" ]; then
    shift
  fi
  tenant=${tenant/dd/brave-dog}
  tenant=${tenant/int/trusting-feynman}
  get_token.sh -r k8s-dev-admin-access -t $tenant > /dev/null
  open "https://k8s.${tenant}.rally-dev.com/#!/overview"
  if [ "$1" == "dd" ]; then
    rally-kubectl -e defaultaccess-rally-dev -t $tenant -W
  fi
}

eval $(thefuck --alias)

alias goo="git open origin master"
alias gpu="git push upstream"

