```
  ▓█████▄  ▒█████  ▄▄▄█████▓  █████▒██▓ ██▓    ▓█████   ██████ 
  ▒██▀ ██▌▒██▒  ██▒▓  ██▒ ▓▒▓██   ▒▓██▒▓██▒    ▓█   ▀ ▒██    ▒ 
  ░██   █▌▒██░  ██▒▒ ▓██░ ▒░▒████ ░▒██▒▒██░    ▒███   ░ ▓██▄   
  ░▓█▄   ▌▒██   ██░░ ▓██▓ ░ ░▓█▒  ░░██░▒██░    ▒▓█  ▄   ▒   ██▒
  ░▒████▓ ░ ████▓▒░  ▒██▒ ░ ░▒█░   ░██░░██████▒░▒████▒▒██████▒▒
   ▒▒▓  ▒ ░ ▒░▒░▒░   ▒ ░░    ▒ ░   ░▓  ░ ▒░▓  ░░░ ▒░ ░▒ ▒▓▒ ▒ ░
   ░ ▒  ▒   ░ ▒ ▒░     ░     ░      ▒ ░░ ░ ▒  ░ ░ ░  ░░ ░▒  ░ ░
   ░ ░  ░ ░ ░ ░ ▒    ░       ░ ░    ▒ ░  ░ ░      ░   ░  ░  ░  
     ░        ░ ░                   ░      ░  ░   ░  ░      ░  
   ░                                                           

  Distro ..................... Debian Sid
  Window Manager ............. bspwm
  Terminal ................... alacritty
  Fonts ...................... Iosevka
  Browser .................... Brave Browser
  File Browser ............... nnn
  Editor ..................... Visual Studio Code
  Media Player ............... mpv
  Launcher ................... rofi
  GTK Theme .................. Dracula
  Icon Theme ................. Papirus-Dark

```

 Manage with xstow
 =============

This repository is meant to be used with stow/xstow. An `install.sh` is included to add all
the needed packages for my system, modify as wanted.


 Improve fonts
 =============

1) Create the following symlinks using root to instruct freetype2 to use good-looking rendering defaults:
   - `ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d`
   - `ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d`
   - `/etc/fonts/conf.avail/10-hinting-slight.conf` should already be linked to `/etc/fonts/conf.d`

2) Modify (or create) `/etc/fonts/local.conf`

3) Modify (or create) `/etc/profile.d/freetype2.sh`


 Chromium
 ====================================

## Enable hardware acceleration

 1) Edit `/etc/chromium.d/default-flags` to contain the following:
  ```
  export CHROMIUM_FLAGS="$CHROMIUM_FLAGS --enable-gpu-rasterization"
  export CHROMIUM_FLAGS="$CHROMIUM_FLAGS --enable-zero-copy"
  export CHROMIUM_FLAGS="$CHROMIUM_FLAGS --ignore-gpu-blocklist"
  export CHROMIUM_FLAGS="$CHROMIUM_FLAGS --disable-gpu-driver-bug-workarounds"
  export CHROMIUM_FLAGS="$CHROMIUM_FLAGS --force-dark-mode"
  export CHROMIUM_FLAGS="$CHROMIUM_FLAGS --use-gl=desktop"
  ```

## Enable widevine

  1) Execute `~/.local/bin/widevine.sh` script;
  2) Access [https://bitmovin.com/demos/drm](https://bitmovin.com/demos/drm) and test widevine

 Thinkpad x250 specific configuration
 ====================================

1) Copy `00-keyboard.conf`, `20-modesetting.conf`, `50-mouse-acceleration.conf` and `90-monitor.conf` to `/etc/X11/xorg.conf.d/`

2) Copy `modules_x250.conf` to `/etc/modprobe.d`


 Improve battery life
 ====================

1) Modify `GRUB_CMDLINE_LINUX_DEFAULT` in `/etc/default/grub` to contain:
   - `i915.semaphores=1 i915.modeset=1 i915.use_mmio_flip=1 i915.powersave=1 i915.enable_ips=1 i915.disable_power_well=1 i915.enable_hangcheck=1 i915.enable_cmd_parser=1 i915.fastboot=0 i915.enable_ppgtt=1 i915.reset=0 i915.lvds_use_ssc=0 i915.enable_psr=0 vblank_mode=0 i915.i915_enable_rc6=1`
   - In Void Linux `intel_iommu=glfx_off` option is needed.

