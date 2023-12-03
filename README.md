The purpose of this doc is to act as a quick lookup guide for me for common tasks instead of having to lookup everything on the net.

## Go to -
- [Youtube Playlists](./docs/youtube_playlists.md)
- [Online Textbooks](./docs/online_books.md)

## PS1 String

Edit in `~/.bashrc`

```bash
# [ <username>@<hostname> <current directory>] $ <commands.....>
PS1='[\e[1;35m\u\e[m@\e[m\e[1;36m\h\e[m \e[1m\W\e[m] \e[1;35m\$\e\m '
```

## Aliases

Edit in `~/.bashrc`

```bash
alias cls='clear'
alias q='exit'
```

## Grub

Edit in `/etc/default/grub`

```bash
# To make grub remember last choice
GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true

# Remove bug/debug messages while bootup or shut down
GRUB_CMDLINE_LINUX_DEFAULT='quiet splash loglevel=3'  # loglevel ranges from 0-6, lower loglevel results in a quieter boot
```

**Remember to update grub after editing in the `/etc/default/grub` file:**

In Ubuntu:

```bash
sudo update-grub
```

# Python

To create a virtual environment:

```python
py -m venv /path/to/venv/
```

To activate a virtual environment:

```python
./venv/Scripts/Activate.ps1
```

To decative simply type `deactivate` in the shell

# Git

For setting up Git, [refer to this Odin Project Guide](https://www.theodinproject.com/lessons/foundations-setting-up-git)

[GitHub reference to SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

For authenticity of GitHub error, [refer to this](https://gist.github.com/vikpe/34454d69fe03a9617f2b009cc3ba200b)




