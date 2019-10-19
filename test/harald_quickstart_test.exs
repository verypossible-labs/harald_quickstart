defmodule HaraldQuickstartTest do
  use ExUnit.Case
  doctest HaraldQuickstart

  test "greets the world" do
    assert HaraldQuickstart.hello() == :world
  end
end
