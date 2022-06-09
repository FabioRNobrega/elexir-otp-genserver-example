defmodule ElhexDelivery.PostalCode.NavigatorTest do
  use ExUnit.Case
  alias ElhexDelivery.PostalCode.Navigator
  doctest(ElhexDelivery)

  describe "get_distance format test" do
    test "postal code strings" do
      distance = Navigator.get_distance("94062", "94104")

      assert is_float(distance)
    end

    test "postal code integer" do
      distance = Navigator.get_distance(94062, 94104)

      assert is_float(distance)
    end

    test "postal code mixed strings and integers" do
      distance = Navigator.get_distance(94062, "94104")

      assert is_float(distance)
    end

    @tag :capture_log
    test "postal code unexpected format" do
      navigator_pid = Process.whereis(:postal_code_navigator)
      reference = Process.monitor(navigator_pid)
      catch_exit do
        Navigator.get_distance("94062", 94104.00)
      end
      assert_received({:DOWN, ^reference, :process, ^navigator_pid, {%ArgumentError{}, _}})
    end
  end

  describe "get_distance (actual distance)" do
    test "distance between rwc and sf" do
      # Redwood City, CA 94062
      # San Francisco, CA 94104
      # Driving Distance ~ 40 miles

      distance = Navigator.get_distance(94062, 94104)
      # IO.puts "RWX ~> SF: #{distance}"
      assert distance == 0.03
    end

    test "distance between sf and ny" do
      # San Francisco, CA 94104
      # New York, NY 10112
      # Driving Distance ~ 3100 miles

      distance = Navigator.get_distance(94104, 10112)
      # IO.puts "SF ~> NY: #{distance}"
      assert distance == 83.25
    end

    test "distance between mn and tx" do
      # Minneapolis, MN 55401
      # Autin, TX 78703
      # Driving Distance ~ 1100 miles

      distance = Navigator.get_distance(55401, 78703)
      # IO.puts "MN ~> TX: #{distance}"
      assert distance == 38.56
    end
  end
end
