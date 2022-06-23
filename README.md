## Miscellaneous
### Useful aliases
Append these to `~/.bashrc`

- `alias prune-volumes="docker volume list --filter dangling=true --format \"{{.Name}}\" | grep -v -e \"chrome-data\" -e \"chrome-keyring-data\" | xargs docker volume rm"`