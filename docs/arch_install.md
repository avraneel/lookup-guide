# Arch install guide

# Pre boot (if dual booting):

- Allocate space
    > I don't recommend GParted for now as Windows Partiton Manager has some problems working with disks if it has been touched with GParted. Not sure why, will check into this later.
    
- Disable fast startup

    ```bat
    powercfg /h off
    ```
    
- Disable secure boot from the UEFI settings

# Booting

```bash
setfont ter-132b # for bigger font
ping archlinux.org # for connection 
```

## Connect to a Network

For WiFi:

  ```bash
  iwctl
  device list # to get your device name
  station <device> scan
  station <device> get-networks # lists all networks
  station <device> connect <SSID>
  exit
  ```

Then check if you are connected by running `ping archlinux.org`

## Partitioning 

If you have 2 disks, then keep 1 for windows and 1 for Linux.

### Windows Partition Table:

> *"If it works, don't fix it"*

| Partition | Size |
|--------|--------|
| EFI System Partition | 200M |
| Microsoft Reserved Partition | 16M |
| C: Drive | Remaining |
| Windows Recovery Partition | 1.1G |

### Linux Disk Partition Table:

The examples in the Archwiki install guide gives a very generic partition table compared to the modern choices distros like Ubuntu is making. Nor is it customised for people with dualboot setups. I recommend building the partition table mentioned below, keeping the following points in mind:

- Create a new EFI System Partition for Linux. This will have a larger size (1G) compared to the Windows EFI Partition (200M) as the windows partition isn't enough to fit everything. [Read more on the arch wiki](https://wiki.archlinux.org/title/Dual_boot_with_Windows#The_EFI_system_partition_created_by_Windows_Setup_is_too_small)

- Create a swapfile instead of a swap partition. This keeps your partition table clean and avoids the need for a separate swap partition. Moreover, it is easier to resize the swapfile compared to resizing a swap partition. [Read more on the arch wiki](https://wiki.archlinux.org/title/Swap#Swap_file)

| Partition | Size | Mount Point |
|--------|--------|--------|
| EFI System Partition | 1G | /boot |
| Root Partition | Remaining | / |

Use `cfdisk` to get a user friendly interface.

## Filesystem Creation

List your devices using 'lsblk'.

### Format the EFI System Partition

The EFI System Partion (ESP) will be formatted to FAT32

```sh
mkfs.fat -F32 /dev/esp
```

### Format the Root Partition

The Root Partition will be formatted to ext4

```sh
mkfs.ext4 /dev/root_partition
```

### Mount the partitions

> [!WARNING]
> If you execute `mount` wrong one time, and then execute `mount` again, those two directories will **stack** and not overwrtie. This will mess up the UUIDs when you will be creating your fstab file later. You need to `umount` the wrong folders one by one. Always check what directories are mounted using `lsblk` after executing the `mount` command. Only proceed further if the output of `lsblk` is to your liking.

```sh
mount /dev/root_partition /mnt
mount --mkdir /dev/esp /mnt/boot
```

Now execute `lsblk` and check if the output is to your liking. If the partitions are mounted properly, only then proceed further.

### Create the swapfile

The old quote *"twice the size of RAM"* is obsolete. Instead, just create a swapfile of 4GB.

```sh
mkswap -U clear --size 4G --file /swapfile # create the swapfile
swapon /swapfile # activate the swapfile
```

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
