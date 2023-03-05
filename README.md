# Linux Tweaks

This is a set of tweaks i apply on distros to make them more customisable to my needs. I'm collecting them all in a single repo so that i don't have to search the web everytime. I'm still new to the whole thing so i'll continue to update it as I continue learning more about Linux.

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

In Arch-based distros: