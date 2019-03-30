# RocketRAID

#### Disclaimer
```
I am not responsible for any damage you made to your device or data.
You have been warned.
```

```
All modules without the "<modulename>-new_scsi.patch" only work bis kernel <=4.16
In version 4.17 the old scsi initialization model are removed from the kernel source.
https://github.com/torvalds/linux/commit/83c9f08e6c6a6dc668384882de4dcf5ef4ae0ba7#diff-3a5b05e51bb8818606db13129d949d18

The modules with this patch will work also with kernels >4.16
Thank's to dlder and his brother for the patch.
https://forums.opensuse.org/showthread.php/535178-Unofficial-driver-for-any-Linux-for-the-quot-Highpoint-RocketRaid-232x-quot-!-(up-to-kernel-4-19-at-least)
```

Infos: https://wiki.gentoo.org/wiki/HighPoint_RocketRAID

Status of the different modules:

| **Mdoule** | **kernel >= 3.0** | **kernel <= 4.15** | **kernel <= 4.16** | **kernel > 4.16** |
|:----------:|:-----------------:|:------------------:|:------------------:|:-----------------:|
|rr172x|yes|yes|no|no|
|rr174x|yes|yes|no|no|
|rr2210|yes|no|no|no|
|rr222x|yes|yes|no|no|
|rr2240|yes|no|no|no|
|rr231x|yes|yes|no|no|
|rr232x|yes|yes|yes|yes|
|rr2340|yes|yes|yes|no|
|rr2522|yes|no|no|no|
|rr2644|yes|no|no|no|
|rr264x|yes|yes|no|no|
|rr268x|yes|yes|no|no|
|rr62x|yes|yes|no|no|
|rr64x|yes|yes|yes|no|
|rr64xl|yes|yes|no|no|
