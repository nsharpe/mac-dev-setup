
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
