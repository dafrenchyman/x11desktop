# x11desktop

Run a complete GUI Python development environment via docker and [x11docker](https://github.com/mviereck/x11docker)

Useful for keeping different projects completely separated from your regular desktop environment.

This image is usage the MATE window manager

# What's included in the image

- Productivity
  - Chromium
  - Firefox
  - Libre Office
- Docker
  - docker forwarding so you can still build and run containers in this environment
  - docker-compose
- Chat:
  - slack
  - zoom (but you'll need to forward your camera on your own by modifying `start.sh`)
- Git
  - git
  - git-cola
  - smartgit
- Development
  - python 3.x
  - Pycharm
- Web
  - postman
  - ngrok

It's pretty easy to fork this and install whatever other packages you want need. I personally use this so I can keep my work isolated away from personal stuff on my computer. I didn't want the overhead of a VM, and I didn't want to install a bunch of stuff on my clean system. Since the home (`~`) folder is saved, my settings are kept between sessions as well.

I'm also using `pycharm`, but you could easily swap that out for something else if desired. So, you're not necessarily stuck with Python if you don't want to b.

_note_ that if you install your own programs, they won't be preserved when you shut the image down. You'll need to add them to the build script to keep them permanant.

# Install

- Install [x11docker](https://github.com/mviereck/x11docker) first
- You _may_ need to setup docker to run [rootless](https://askubuntu.com/questions/477551/how-can-i-use-docker-without-sudo) (or you can modify the scripts)
- Build the container image: `./build.sh`
- Run the container image: `./start.sh`
  - You can optionally set the amount of _memory_ (default: `8g`) and the name of the _workspace_ (default: `x11desktop`)like so:
    `./start.sh 16g workspace_a`
- The container's home folder will also be mounted to `~/docker_volumes/<workspace_name>/home`.

# Setup for developement

- `pre-commit install`
- `apt-get install shellcheck`

## Run `pre-commit` locally

`pre-commit run --all-files`
