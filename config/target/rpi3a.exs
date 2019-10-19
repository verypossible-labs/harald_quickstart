import Config

config :nerves, :firmware, fwup_conf: "config/target/rpi3a/fwup.conf"

config :nerves_init_gadget,
  ifname: "usb0",
  address_method: :dhcpd
