# Arch install guide

# Pre boot (if dual booting):

1. Allocate space
2. Disable fast startup (from control panel)
3. Disable secure boot

# Booting

- `setfont ter-132b` for bigger font
- `ping archlinux.org` for connection 

## Partitioning 

- Partiton with `cfdisk \dev\nvme0n1` (no need for ESP if dual booting)
- `mkfs.ext4 /dev/root_partition` and `mkswap /dev/swap_partition`
- `mount /dev/root_partition /mnt` and `swapon /dev/swap_partition`

## Mirrors and packages

- `cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak`
- `pacman -Sy`
- `pacman -S pacman-contrib`
- `rankmirrors -n 10 /etc/pacman.d/mirrorlist.bak > /etc/pacman.d/mirrorlist` and wait
- `pacstrap -i `

# Automount a partition/device during boot

- Get the UUID of the device by `lsblk -f` 
- Edit the `/etc/fstab` file. [More Info on Archwiki](https://wiki.archlinux.org/title/fstab)
- Use `defaults` for option column

