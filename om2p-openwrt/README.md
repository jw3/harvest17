om2p openwrt build
==================

The

After building your firmware your firmware will be the following:

`trunk/bin/ar71xx/openwrt-ar71xx-generic-om2p-squashfs-factory.bin`

Use the ap51-flash utility

`./ap51-flash eth0 trunk/bin/ar71xx/openwrt-ar71xx-generic-om2p-squashfs-factory.bin`

 Then plugin the OM2P in eth0 and power it up.

The output of the flash tool should look like this:

```
  [MA:C-:AD:DR:ES:S ]: type 'OM2P router' detected
  [MA:C-:AD:DR:ES:S ]: OM2P router: tftp client asks for 'fwupgrade.cfg', serving fwupgrade.cfg portion of: openwrt-ar71xx-generic-om2p-squashfs-factory.bin (1 blocks) ...
  [MA:C-:AD:DR:ES:S ]: OM2P router: tftp client asks for 'kernel', serving kernel portion of: openwrt-ar71xx-generic-om2p-squashfs-factory.bin (1993 blocks) ...
  [MA:C-:AD:DR:ES:S ]: OM2P router: tftp client asks for 'rootfs', serving rootfs portion of: openwrt-ar71xx-generic-om2p-squashfs-factory.bin (4609 blocks) ...
  [MA:C-:AD:DR:ES:S ]: OM2P router: image successfully transmitted - writing image to flash ...
  [MA:C-:AD:DR:ES:S ]: OM2P router: flash complete. Device ready to unplug.
```

### Upgrades

The recommended way to upgrade is via the "sysupgrade" script. Just copy the factory image (openwrt-ar71xx-generic-om2p-squashfs-factory.bin) to the /tmp folder and run:

`sysupgrade /tmp/openwrt-ar71xx-generic-om2p-squashfs-factory.bin`


### source

https://wiki.openwrt.org/toh/openmesh/om2p


### errors

- `odhcpd-ipv6only`
  - check_data_file_clashes: Package odhcpd-ipv6only wants to install file /openwrt/build_dir/target-mips_24kc_musl/root-ar71xx/etc/init.d/odhcpd But that file is already provided by package  * odhcpd
