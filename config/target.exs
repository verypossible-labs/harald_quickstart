use Mix.Config

# Authorize the device to receive firmware using your public key.
# See https://hexdocs.pm/nerves_firmware_ssh/readme.html for more information
# on configuring nerves_firmware_ssh.

config :nerves_runtime, :kernel, use_system_registry: false

# Configure nerves_init_gadget.
# See https://hexdocs.pm/nerves_init_gadget/readme.html for more information.

# Setting the node_name will enable Erlang Distribution.
# Only enable this for prod if you understand the risks.
node_name = if Mix.env() != :prod, do: "harald_quickstart"

config :nerves_init_gadget,
  ifname: "eth0",
  address_method: :dhcp,
  mdns_domain: "nerves.local",
  node_name: node_name,
  node_host: :mdns_domain,
  ssh_user_passwords: [{"harald", "harald"}]

config :harald, :transport_opts,
  namespace: :bt,
  adapter: {Harald.Transport.UART, device: "/dev/ttyAMA0", uart_opts: [speed: 115_200]}

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.target()}.exs"
target_config = Path.join(["config/target/#{Mix.target()}.exs"]) |> Path.expand()

if File.exists?(target_config) do
  import_config(target_config)
end
