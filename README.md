# Harald Quickstart Firmware

The harald quickstart firmware lets you try out harald on real hardware without
the need to create a new Nerves project or compile any code.

Find the appropriate firmware or zip file
[here](https://github.com/verypossible/harald_quickstart/releases). If
you're using `fwup` to write images to MicroSD cards, download the `.fw`
extension and if you're using `etcher`, get the `zip` file. Releases are named
by the boards they support:

* `bbb` - BeagleBone Black, BeagleBone Green, PocketBeagle, etc.
* `rpi0` - Raspberry Pi Zero or Zero W
* `rpi` - The original Raspberry Pi Model B
* `rpi2` Raspberry Pi 2 Model B
* `rpi3` - Raspberry Pi 3 Model B and Model B+
* `rpi3a` - Raspberry Pi 3 Model A+
* `rpi4` - Raspberry Pi 4 Model B
* `x86_64` - Basic x86 hardware
Once that's done, you're ready to burn the firmware to the MicroSD card.

## Burning the Firmware

Navigate to the directory where you downloaded the firmware. We'll go through
both `fwup` and `etcher` methods.

To be clear, this formats your SD card, and you will *lose all data on the SD
card*. Make sure you're OK with that.

### `fwup`

```console
fwup harald_quickstart_rpi0.fw
Use 15.84 GB memory card found at /dev/rdisk2? [y/N] y
```

Depending on your OS, you'll likely be asked to authenticate this action. Go
ahead and do so.

```console
|====================================| 100% (31.81 / 31.81) MB
Success!
Elapsed time: 3.595 s
```

It's quite fast. Now you have Nerves ready to run on your device.  Skip ahead to
the next section.

### `etcher`

Start `etcher`, point it to the zip file, and follow the prompts:

![etcher screenshot](assets/etcher.png)

## Testing the Firmware

Eject the SD card and insert it into the device that you're using. Power up and
connect the device with a USB cable. In the case of the `rpi0`, the micro USB
does both.

Once the device boots, you can now connect to it. There are three ways to
connect to the device: `ssh`, `picocom`, and distributed Erlang. We'll take a
look at `ssh`.

### `ssh`

The `harald_quickstart` project configures the user as `harald` with the
host `nerves.local` and has the password set as `harald`. With that in mind,
we can use the `ssh` command to get to the `iex` prompt.

```console
ssh harald@nerves.local

SSH server
Enter password for "harald"
password:
Interactive Elixir (1.9.2) - press Ctrl+C to exit (type h() ENTER for help)
Toolshed imported. Run h(Toolshed) for more info

View log messages with `RingLogger.next` or `RingLogger.attach`. Toolshed
helpers are available. Type `h Toolshed` for details.

iex(harald_quickstart@nerves.local)1>
```

Now that we have an IEx prompt, lets scan for bluetooth devices

```elixir
iex(harald_quickstart@nerves.local)1> Harald.LE.scan(:bt)
%{
  98485100363035 => %Harald.HCI.Event.LEMeta.AdvertisingReport.Device{
    address: 98485100363035,
    address_type: 1,
    data: [
      <<>>,
      {"Manufacturer Specific Data", <<>>}
    ],
    event_type: 0,
    rss: 168
  },
  122396970879915 => %Harald.HCI.Event.LEMeta.AdvertisingReport.Device{
    address: 122396970879915,
    address_type: 1,
    data: [
      <<>>,
      {"Manufacturer Specific Data",
       <<>>}
    ],
    event_type: 0,
    rss: 188
  }
}
```
