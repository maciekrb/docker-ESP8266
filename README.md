# Docker Container for integrated ESP8266 chip Development
Repo can build a Docker image that contains the ESP Open SDK tools needed to interact with ESP8266 chips. Please refer to the [SDK documentation](https://github.com/pfalcon/esp-open-sdk) for details on how to use the SDK tools.

## How to use
Fork the repo and include a `src` directory in the root of the project. The included `docker-compose.yml` file mounts the source inside of the container under `/home/dev/src` so you can still edit your code in your local machine while using the SDK tools from a command line within the container.

First, build the image, the SDK downloads take a while, so be patient, you will only need to do this once.
```
$ docker-compose build devenv
```

If your docker version relies on VirtualBox, make sure you make the USB device available to the image:
![USB Device config](https://github.com/maciekrb/docker-ESP8266/assets/vboxusbconf.png "Virtual Box USB Device config")

Create a `src` directory in the root of the project, and you are ready to get a shell inside of the container. Note that anything you have under the `src/` directory will get mounted under `/home/dev/src` inside the container.

```
$ docker-compose run devenv bash
```

The path of the SDK tools is included in the path, so from the shell you can invoke any tool from the SDK. You can also replace `bash` with any command (ie. `esptool.py ...`)

Enjoy !


