# Arch & Gentoo Quick Install
[url1]: https://wiki.archlinux.org/index.php/Installation_guide
[url2]: https://wiki.gentoo.org/wiki/Handbook:Main_Page

Contains installations scripts for [Arch Linux][url1] and [Gentoo][url2].
Please only use if:

- You're comfortable with using scripts that are:
  - a work in progress
  - from someone random on the internet
- You have already done non-graphical installations a few times.
- You are comfortable debugging bash scripts

NOTE: Partitioning and formatting isn't covered yet, as screwing that up is a big no no.

## Goals

I still don't have the use case for these scripts well defined,
so it may evolve with time, but this is what I'm trying to accomplish:

### Clarity and Sanity
Currently the top priority is clarity, after that its sanity.
For example:
while `wifi-menu` is easier to use,
I have been bitten by it too many times,
and prefer using `wpa_supplicant` directly instead.

Maybe with each script include a `.txt` file explaining commands and their flags, while referencing documentation (wiki or `man`).

Understand Consequences of:

- Reapeting an `installation_step` several times. Does it break anything?
- Difference between:
  1.  doing all in one session,
  2.  and logging out inbetween functions


### Finish the installation in a minimal fashion.
Try to get a bootable installation as quickly as possible.
Before when I was using Arch, I would try to get everything (ie a Desktop Enviroment) installed with pacstrap.
It felt great booting into your system for the first time, and not being greeted by a console demanding more work.
However if you're using a source-based distros this will diffentively not scale.
So in order to maintain an uniform structure, the installation of things not required to boot will not be included.

#### Other things might be removed
- locale related stuff
- log installation (maybe, since you don't have anything to log yet)

#### Things that are needed
- If you have multiple partitions: fstab and maybe initramfs
- If an essential partition isn't ext4: the needed filesystem package installed
