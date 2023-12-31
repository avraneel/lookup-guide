# Arch install guide

# Pre boot (if dual booting):

- Allocate space
    > I don't recommend GParted for now as Windows Partiton Manager has some problems working with disks if it has been touched with GParted. Not sure why, will check into this later.
- Disable fast startup (from control panel)
- Disable secure boot

# Booting

- `setfont ter-132b` for bigger font
- `ping archlinux.org` for connection 

## Partitioning 

- Partiton with `cfdisk /dev/nvme0n1` (no need for ESP if dual booting)
- `mkfs.ext4 /dev/root_partition` and `mkswap /dev/swap_partition`
- `mount /dev/root_partition /mnt` and `swapon /dev/swap_partition`

## Mirrors and packages

- `cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak`
- `pacman -Sy`
- `pacman -S pacman-contrib`
- `rankmirrors -n 10 /etc/pacman.d/mirrorlist.bak > /etc/pacman.d/mirrorlist` and wait
- `pacstrap -K /mnt base linux linux-headers linux-firmware linux-lts-headers linux-lts linux-zen sudo nano`

## Generate fstab file

-  `genfstab -U /mnt >> /mnt/etc/fstab`

### Automount a partition/device during boot

- Get the UUID of the device by `lsblk -f` 
- Edit the `/etc/fstab` file. [More Info on Archwiki](https://wiki.archlinux.org/title/fstab)
- Use `defaults` for option column

## Change root

- `arch-chroot /mnt`
- `ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime`
- `hwclock --systohc`

## Locale gen

- Edit `/etc/locale.gen` and uncomment `en_US.UTF-8 UTF-8`
- `locale-gen`
- Create `/etc/locale.conf` and put `LANG=en_US.UTF-8`

## Network Configuration

- Create `/etc/hostname` and put your `hostname` in there


## Passwords

- Add root password
    ```
    # passwd
    ```

## Boot Loader

### GRUB

It just works™


### Systemd-boot

