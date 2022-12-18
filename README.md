# Some of my day-to-day software, in Docker containers

After knowing that saved Chrome passwords and cookies in Linux are not protected against malicious dependencies in our development environment or other apps in our system, I decided to run my core apps in Docker containers, where their data is not accessible without sudo, and a personal understanding of where stuff is being saved.

Contrary to <https://github.com/jessfraz/dockerfiles/>, docker-workspaces:
  - runs Chrome in a sandbox
  - encrypts passwords and cookies with the help of an also dockerized gnome-keychain
  - works with your headphones

## Development

### Practices

- Enable the `sudo` command in the containers so you can easily update the software in the containers with `sudo apt update && sudo apt upgrade`, while using said software and not needing to rebuild and restart the container.
- Always use a non-root user as early as possible in Dockerfile.
  - Make sure all Docker containers run with a non-root user

### Useful snippets

- Upgrade all packages without rebuilding the whole image and any base images that it uses
  ```
  ARG CACHEBUST
  RUN echo "cache bust $CACHEBUST"

  RUN apt-get update && apt-get upgrade -y --no-install-recommends
  ```

- Set timezone inside container
  - Dockerfile
    ```
    ARG TZ
    ENV TZ=$TZ
    RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
    RUN apt-get install -y tzdata
    ```
  - When running the docker container
    ```
    -v /etc/timezone:/etc/timezone:ro
    -v /etc/localtime:/etc/localtime:ro
    ```
  - Before starting the software inside the docker container
    ```
    export TZ=$(cat /etc/timezone)
    ```
- Add `sudo` to container
  - add final user to `sudo` group
  - set it's password
    ```
    RUN echo "user:password" | chpasswd
    ```

### Links

- [Using dynamically created devices (--device-cgroup-rule)](https://docs.docker.com/engine/reference/commandline/run/#-using-dynamically-created-devices---device-cgroup-rule)
- [Access an NVIDIA GPU](https://docs.docker.com/engine/reference/commandline/run/#access-an-nvidia-gpu)
- <https://blog.jessfraz.com/post/docker-containers-on-the-desktop/>
- https://docs.docker.com/engine/reference/builder/#buildkit
- https://leimao.github.io/blog/Docker-Container-Audio/
- https://github.com/docker/buildx

### To think about

- Using X11 in Mac
  - taken from <https://github.com/blacktop/docker-ghidra/blob/master/README.md>

  1. Install XQuartz `brew install xquartz`
  2. Install socat `brew install socat`
  3. `open -a XQuartz` and make sure you **"Allow connections from network clients"** (in XQuartz > Preferences... > Security)
  4. Now add the IP using Xhost with: `xhost + 127.0.0.1` or `xhost + $(ipconfig getifaddr en0)`
  5. Start socat `socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"`
  6. Start up Ghidra

  ```bash
  $ docker run --init -it --rm \
              --name ghidra \
              --cpus 2 \
              --memory 4g \
              -e MAXMEM=4G \
              -e DISPLAY=host.docker.internal:0 \
              -v /path/to/samples:/samples \
              -v /path/to/projects:/root \
              blacktop/ghidra
