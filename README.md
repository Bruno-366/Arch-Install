See the README.md of the Settings.txt branch if you haven't already.

# The goal of this branch
was to address the issue highlighted in this paragraph: (of the Settings.txt's README.md)

> Unfortunately, one of the consequences of this added feature is that it adds extra if-else logic to the scripts.

It bugged me that you would open a file, and
instead of seeing either:

- the bare minimum required to perform that step, or
- much more code providing interactivity,

you would see both at the same time.

Which is fine in most cases,
exept this project was created with the explicit purpose of KISS,
so that newbies could:

- peform an installation in an user-friendly way,
- see all the commands of an installation inside of a script.
  (in case they wanted to write their own)

# The idea for this branch
was to execute a script contained in `var-helpers/`
if the corresponding variable was empty.
I encountered 3 problems.

## Problem 1
How to know if a variable is empty.
I could probably have used some sort of loop,
inside of which I used `-z "$var"`.
However, what I would have prefered is the following:

> I could have an extra script that with `set` (no params) checks if a variable is empty.
> For example: `set | grep '^[^_].*=$'`

Despite that,
I didn't like the idea of having an extra script which handles other scripts.
I've tried that sort of meta-script thing before, and it wasn't elegant.

## Solution?
The idea was to have `Settings.txt` by default get all values from the scripts,
That is,
for all the variables it would contain something like `var=$(script)`.
That way,
if someone wanted to provide their own values,
they would have to change that text.

In either case, the variable isn't empty.

## Nope 1:
ie Problem 2.

Since `set -o` aren't exported to subshells,
I had to source all the scripts that I wanted, 
if e.g. `set -o errexit` were to work (without a bunch of duplication that is).
This means I couldn't do `./file.sh` or `bash file.sh`.

## Nope 2:
ie Problem 3.

The reason I'm not doing `var=$(script)` is that would massively complicate things.
The scripts are aimed at providing interactivity.
That mainly means it's going to print questions to stdout.
So, either I print everything exept the value to stderr (which is stupid),
or I use some weird `var=$(script | tail)`.
Either way I didn't want to have to deal with that.

## Solution?
For this reason,
I moved `var-helpers/` to `Settings/`.
There each file would contain either:
- the value of a var, or 
- a script that would provide that value.

The idea is the same as previous solution paragraph.

> if someone wanted to provide their own values,
> they would have to change that text.

Since these files would be `source`d,
there would be no scope, and the integration would be easy.
There would be no need for `var=$(script | tail)`.

However, being told:
"hey, this file contains code that you can just overwrite"
isn't exactly the best user-experience.
And, what if later they want to use that code that they just deleted??

> but, why move it into seperate files in `Settings/`, in the first place?
> Why not keep it in `Settings.txt` by doing `var=$(source script)`? 

Becuase, as all the main scripts source `Settings.txt`.
That means that when main script is run, all un-related helping scripts are run.
