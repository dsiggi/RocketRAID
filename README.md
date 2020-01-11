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

| **Mdoule** | **kernel >= 3.0** | **kernel <= 4.15** | **kernel <= 4.16** | **kernel > 4.16** | **kernel = 5.x** |
|:----------:|:-----------------:|:------------------:|:------------------:|:-----------------:|:-----------------|
|rr172x|yes|yes|no|no|nt|
|rr174x|yes|yes|no|no|nt|
|rr2210|yes|no|no|no|nt|
|rr222x|yes|yes|no|no|nt|
|rr2240|yes|no|no|no|nt|
|rr231x|yes|yes|no|no|nt|
|rr232x|yes|yes|yes|yes|nt|
|rr2340|yes|yes|yes|no|nt|
|rr2522|yes|no|no|no|nt|
|rr2644|yes|no|no|no|nt|
|rr264x|yes|yes|no|no|nt|
|rr268x|yes|yes|no|no|nt|
|rr62x|yes|yes|no|no|nt|
|rr64x|yes|yes|yes|no|nt|
|rr64xl|yes|yes|no|no|yes|

nt = not tested
