
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# Docker aliases
# rm all containers
alias docker-rmac="docker ps -aq | xargs docker rm"
# rm all images
alias docker-rmai="docker images --no-trunc -aq | xargs docker rmi"
