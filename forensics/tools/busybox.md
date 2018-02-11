# busybox

### Description:

busybox is an all-in-one toolkit for linux systems. It's a single binary executable that contains programs such as `grep`, `cat`, `find` etc. Busybox is also easy to statically compile, making it and ideal tool for forensic investigations. By being statically compiled, it doens't depend on libraries that could be compromised on the system under investigation. 

### Source:

Source code can be downloaded at: [busybox.net](https://busybox.net/downloads/)

### Compilation:

A guide for compiling busybox is found at: (https://github.com/ukanth/afwall/wiki/HOWTO-Compiling-busybox). These steps are for cross-compiling for ARM, but just skipping that step will produce an x86/x64 binary.

#### Summary to compile
1. `apt-get install -y gcc build-essential libncurses5-dev libpam0g-dev libsepol1-dev libselinux1-dev` - to install dependencies
2. `tar -xf busybox-1.28.0.tar.bz2` - extract source code
3. `make defconfg` - sets the config to useful defaults
4. `make menuconfig` - Busybox Settings --> Build Options --> Build Busybox as a static binary (no shared libs)
5. `make` - actual build

### Review:

Busybox is a critical part of the linux forensics toolkit, as it allows the examiner to have more confidence and trust in what they're seeing. There is still the chance of a compromised kernel or other module that is corrupting the results, but since all libraries are staticallly compiled into the binary, they don't have to be trusted. Busybox provides almost all the core linux/unix tools that are needed to examine a linux system. 

### Usage:

The above section on compliation describes the steps needed to compile the binary. While there can be some variation in versions and systems, in general, the binary should be compiled on a system that is as close as possible to the target system.

Invoking the tools within busybox can be done by either setting up symlinks ex: (`/usr/bin/grep -> busybox`) or invoking busybox directly ex: (`./busybox grep searchterm`)
