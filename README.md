# Some of my day-to-day software, in Docker containers

After knowing that saved Chrome passwords and cookies in Linux are not protected against malicious dependencies in our development environment or other apps in our system, I decided to run my core apps in Docker containers, where their data is not accessible without sudo, and a personal understanding of where stuff is being saved.

Contrary to <https://github.com/jessfraz/dockerfiles/>, docker-workspaces:
  - runs Chrome in a sandbox
  - encrypts passwords and cookies with the help of an also dockerized gnome-keychain
  - works with your headphones

## Miscellaneous
### Useful aliases
Append these to `~/.bashrc`

- `alias prune-volumes="docker volume list --filter dangling=true --format \"{{.Name}}\" | grep -v -e \"chrome-data\" -e \"chrome-keyring-data\" | xargs docker volume rm"`