import Config

config :nerves, :firmware, fwup_conf: "config/target/rpi3/fwup.conf"

config :nerves_init_gadget,
  ifname: "eth0",
  address_method: :dhcp
