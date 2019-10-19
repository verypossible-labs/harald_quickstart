# Add Toolshed helpers to the IEx session
use Toolshed

if RingLogger in Application.get_env(:logger, :backends, []) do
  IO.puts """
  View log messages with `RingLogger.next` or `RingLogger.attach`. Toolshed
  helpers are available. Type `h Toolshed` for details.
  If connecting via ssh, type `exit` or `<enter>~.` to disconnect.
  """
end

# Be careful when adding to this file. Nearly any error can crash the VM and
# cause a reboot.
