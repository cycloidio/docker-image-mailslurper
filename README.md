# Docker Image MailSlurper

This repository contains a _Dockerfile_ to create a docker image of the [MailSlurper, a small SMTP mail server useful for testing, and other purposes](https://github.com/mailslurper/mailslurper).

The repository also contains a _Makefile_ to just wrap the most used commands into _makefile targets_, like build the docker image, etc.

## How to use it

The docker image executes the mailslurper by default, if you would like to execute the [createcredentials command](https://github.com/mailslurper/mailslurper/tree/master/cmd/createcredentials) then rewrite the CMD instruction with `docker run`.

_Mailslurper_ is configured through a configuration file, however it doesn't currently have any flag to specify where the configuration file is, hence it must be where the binary is executed. For achieving this with Docker you have to map a volume with the _config.json_ file to the container directory `/mailsruper` which is from where the commands are executed, for example:

`docker run -v /home/user/config.json:/mailslurper cycloid/mailslurper:{TAG}`

Where `{TAG}` is the docker tag which specifies the MailSlurper version.

## Important considerations

Currently we decided not to push any docker image with previous versions than the last one when this repo was created nor to push any image without a docker tag (as you should know it defaults to latest).

## License

The MIT License (MIT)
Copyright (c) 2018 cycloid.io
Read the LICENSE file for more information.
