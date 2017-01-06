
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# Docker aliases
# rm all containers
alias docker-rmac="docker ps -aq | xargs docker rm"
# rm all images
alias docker-rmai="docker images --no-trunc -aq | xargs docker rmi"
# rm all volumes
alias docker-rmav="docker volume ls -qf dangling=true | xargs docker volume rm "
# rm all containers, images, and volumes
alias docker-clear-all="docker-rmac; docker-rmai; docker-rmav"

# prefered way of searching a directory
alias la="ls -la"

### GIT HELPERS
# export the current branch name to BRANCH_NAME
alias ex-branch-name='BRANCH_NAME="$(git rev-parse --abbrev-ref HEAD)"'
# Pull the latest from master
alias pull-master="ex-branch-name; git checkout master; git pull origin master; git checkout $BRANCH_NAME"
# Rebase the current branch ontop of master
alias rebase-master="~/scripts/git-rebase-master.sh"
