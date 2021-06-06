# Misc-Scripts
Contains installations scripts for [Arch Linux][url1] and [Gentoo][url2].
The files-names are intended to be rather self-explanatory, and should give you a good overview of what the scope of this project is.
You are most welcome to take a peek at the scripts to see what they're actually doing too!

**Note:** Partitioning and formatting isn't covered yet, as screwing that up is a big no no.
I recommend using [GParted][url3] to partition your disk, or using the tools included in the live-USB of the distro you're trying to install.

**Settings.txt:** With this file you can predefine stuff, allowing the scripts to skips some steps, resulting in an installation with less interaction.
This is where the bulk of usefulness comes from IMHO, as it allows for a more streamlined, less ad-hoc installation.

# Goals
## Clarity (Newbies come hither)
Initially, the goal was to keep it easy to understand for newcomers so that they may create their own installation scripts.
This is still the case, however I believe architecturally having a centralized file to retrieve values from is initially non-obvious for newbies.
At least, that was the case for me :) so just be aware of it.

Unfortunately, one of the consequences of this added feature is that it adds extra if-else logic to the scripts.
So far, it has lead to a bit of refactoring, and the parts containing said logic can mainly be ignored.
Also, the structure of the scripts should be such that the straight forward (non-interactive) way of doing things are at the top.
The benefit of this (or at least the justification, heh) is that this way it isn't a matter of either:

- running the scripts completely interactively, inputting the information it asks of you.
- or editing the scripts one by one, deleting the interactive parts, and writing directly the information it requires to function.

IMHO, it is much clearer;

- not only what information you can omit during the installation, by predefining it in `Settings.txt` (hopefully most),
- but also what the consequences of doing so are, i.e. what is skipped and how it affects the scripts' execution.

This clarity will hopefully allow a newbie to progress in a more granular manner.
The script doesn't need to be understood in it's entirety (although that's the goal), in order to be immediately useful.

## Sanity
Currently the top priority is clarity, after that its sanity.
For example:
while `wifi-menu` is easier to use,
I have been bitten by it's behaviour too many times,
and prefer using `wpa_supplicant` directly instead.

TODO: Understand consequences of:

-[] Repeating an `installation_step` several times. Does it break anything?
-[] Difference between:
  1.  doing all in one session,
  2.  and logging out in-between functions


### Finish the installation in a minimal fashion.
Try to get a bootable installation as quickly as possible.
Before when I was using Arch, I would try to get everything (ie a Desktop Environment) installed with `pacstrap`.
It felt great booting into your system for the first time, instead of being greeted by a console demanding more work.
However, if you're using a source-based distro this will definitively not scale.
So in order to maintain an uniform structure, the installation of things not required to boot will not be included.

#### Other things that might be removed
- locale related stuff
- log installation (maybe, since you don't have anything to log yet)

#### Things that are needed
- If you have multiple partitions: fstab and maybe initramfs
- If an essential partition isn't ext4: the needed filesystem package installed

# Achtung!
Please only use if:

- You have already done non-graphical installations a few times.
- You're comfortable with using scripts that are:
  - a work in progress
  - from someone random on the internet
- You are comfortable debugging bash scripts


[url1]: https://wiki.archlinux.org/index.php/Installation_guide
[url2]: https://wiki.gentoo.org/wiki/Handbook:Main_Page
[url3]: http://gparted.org/livecd.php
