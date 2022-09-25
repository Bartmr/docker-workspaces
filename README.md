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

## Development

### Useful snippets

- Upgrade all packages without rebuilding the whole image and any base images that it uses
  ```
  ARG CACHEBUST
  RUN echo "cache bust $CACHEBUST"

  RUN apt-get update && apt-get upgrade -y --no-install-recommends
  ```

- Set timezone inside container
  ```
  ARG TZ
  ENV TZ=$TZ
  RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
  RUN apt-get install -y tzdata
  ```

- Add `sudo` to container
  - add final user to `sudo` group
  - set it's password
    ```
    RUN echo "user:password" | chpasswd
    ```