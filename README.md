# box86-docker
[Box86](https://github.com/ptitSeb/box86), the x86 emulator, running in a docker.

Built to run x86 apps in docker containers on ARM devices. My primary use case was running a teamspeak3-server on a Raspberry Pi 4 or an RK-3328/3399 board.

```docker
FROM anujdatar/box86

# install/copy your x86 program here

CMD ["/box86/build/box86", "path-to-x86-executable"]
```

Uses `debian:buster-slim` as the base image. You can also use `python:slim-buster` as the base for the runner image if your target application needs python. You'd just have to build the image. Or install python3 on top of this image.

