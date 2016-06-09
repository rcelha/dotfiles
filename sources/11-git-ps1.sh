function parse_git_branch {
   ref=$(git symbolic-ref HEAD 2> /dev/null) || return
   echo "${ref#refs/heads/} "
}
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[01;32m\]"
export PS1=" $YELLOW\$(parse_git_branch)$GREEN\w $\[\033[00m\] "
