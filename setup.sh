
if [ DOCKER_WORKSPACES_SET_UP != "true" ]
then
  echo  '
# From docker-workspaces repository
alias prune-volumes="docker volume list --filter dangling=true --format \"{{.Name}}\" | grep -v \"chrome-data\" | xargs docker volume rm"

export DOCKER_WORKSPACES_SET_UP=true' >> ~/.bashrc 
fi
