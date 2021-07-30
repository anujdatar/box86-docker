# box86-docker
[Box86](https://github.com/ptitSeb/box86), the x86 emulator, running in a docker.

Built to run x86 apps in docker containers on ARM devices. My primary use case was running a teamspeak3-server. Uses `debian:buster-slim` as the base image.

```docker
FROM anujdatar/box86

# install/copy your x86 program here

CMD ["/box86/build/box86", "<path-to-x86-executable"]
```
