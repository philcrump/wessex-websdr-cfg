# websdr-cfg

## Webpages

Webpages for the websdr are served by nginx out of the 'htdocs/' directory.

'pub' and 'pub2' directories are required to be in this location by 'websdr64' but the HTML/JS/CSS files contained are not used.

## WebSDR Configuration

WebSDR server configuration is in the file _websdr.cfg_

RTL_TCP configurations can be modified in the _rtltcp_xxxx.sh_ scripts.

To apply either of the above you'll need to restart the websdr with:

```bash
sudo systemctl restart websdr`
```
(There may be a few seconds delay before the websdr server is available again, as it initializes all the bands.) 

## Initial Server setup

### Dell Optiplex 3070 Hardware
 * Hold F2 on startup to enter BIOS configuration
   * Ensure that 'System Configuration' -> 'SATA Operation' is set to "AHCI" 
   * Ensure that 'Power Management' -> 'On AC Recovery' is set to "Power On"
   * Exit, applying settings.
 * Hold F12 on reboot to enter boot menu
   * Select `UEFI: <USB Disk name>` to boot from Ubuntu install disk


### Ubuntu Server 22.04 Installer
 * Ensure machine is attached to a DHCP network
 * English (UK)
 * Update to new installer (if asked)
 * Select 'Ubuntu Server', Tick 'Search for third-party drivers'
 * (Use default network settings)
 * Storage: Use Entire Disk
 * Profile
   * Your Name / Username: "websdr"
   * Hostname: "optiplex3070-websdr"
   * Password: "\<choose a password\>"
 * SSH Setup: Tick 'Install OpenSSH Server'
 * Server Snaps: (none applicable)
 * (Install now runs)


### Operating System Setup (via SSH)
```bash
sudo apt update && sudo apt dist-upgrade
sudo apt autoremove
sudo apt install git htop curl wget build-essential cmake pkg-config vim
sudo reboot
```

### Custom FFTW3 (with AVX2 support)
```bash
wget 'https://www.fftw.org/fftw-3.3.10.tar.gz'
tar -xzf fftw-3.3.10.tar.gz 
cd fftw-3.3.10/
./configure --enable-float --enable-threads --enable-shared --enable-sse --enable-sse2 --enable-avx --enable-avx2 --enable-avx-128-fma --enable-generic-simd128 --enable-generic-simd256
make -j4
sudo make install
sudo ldconfig
```

### WebSDR dependencies
```bash
sudo apt install libasound2
sudo dpkg -i dependencies/libpng12-0_1.2.54-6_amd64.deb dependencies/libssl1.0.0_1.0.2n-1ubuntu5_amd64.deb
```

### Nginx Install

Install mainline repo from: http://nginx.org/en/linux_packages.html#Ubuntu

Install config:
```bash
sudo cp -fv nginx-conf/nginx.conf /etc/nginx/nginx.conf
sudo systemctl restart nginx
```

### Custom rtl_tcp (with frequency lock)
```bash
sudo apt install git build-essential cmake libusb-1.0-0-dev
git clone https://github.com/philcrump/librtlsdr.git
cd librtlsdr
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON
make
sudo make install
sudo ldconfig
```


## Authors

Phil Crump <phil@philcrump.co.uk>
