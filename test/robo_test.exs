defmodule Toyrobot.RoboTest do
  use ExUnit.Case
  alias Toyrobot.Robo

  describe "call/1" do
    test "when send commands, execute commands and print position" do
      commands = """
      PLACE 0,0,NORTH
      MOVE
      RIGHT
      MOVE
      LEFT
      MOVE
      REPORT
      """

      assert Robo.call(commands) == :end
    end
  end
end
