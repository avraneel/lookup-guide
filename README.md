The purpose of this doc is to act as a quick lookup guide for me for common tasks instead of having to lookup everything on the net.

## Go to -
- [Youtube Playlists](./docs/youtube_playlists.md)
- [Online Textbooks](./docs/online_textbooks.md)
- [Arch Install Guide](./docs/arch_install.md)

## Windows

- [Restore Legacy Right Click context menu](https://answers.microsoft.com/en-us/windows/forum/all/restore-old-right-click-context-menu-in-windows-11/a62e797c-eaf3-411b-aeec-e460e6e5a82a)



## PS1 String

Edit in `~/.bashrc`

```bash
# username hostname curr_dir $ <commands.....>
PS1='PS1='\u \h \w \\$''
```

Make venv look bold lavender in bash:

```sh
__venv_prompt() {
    [[ -n "$VIRTUAL_ENV" ]] && \
    printf "\[\e[1;38;5;135m\](%s)\[\e[0m\] " "$(basename "$VIRTUAL_ENV")"
}

PS1='$(__venv_prompt)'$PS1
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

[Settng up SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

[GitHub reference to SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

For authenticity of GitHub error, [refer to this](https://gist.github.com/vikpe/34454d69fe03a9617f2b009cc3ba200b)




