# SETUP ARCH

```loadkeys de```

```ip link```

List all partitions: `lsblk`

## Setup Filesystem
```cryptsetup luksEncrypt```

luksopen

btrfs
btrfs subvols

mount btrfs @arch and @home

pacstrap

```bash
arch-chroot /mnt/root
```



## Install Sway
```pacman -S git openssh opendoas firefox foot sway```

```systemctl enable --now seatd```


Add this code to your bash profile:
```shell
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec sway
fi
```