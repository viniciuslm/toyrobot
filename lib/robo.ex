defmodule Toyrobot.Robo do
  def call(commands_string) do
    commands_string
    |> String.split("\n")
    |> process_commads()
  end

  defp process_commads(commands, position \\ nil) do
  defp process_commads([], _), do: :end
  defp process_commads([command | other_commads], position) do
    position = process_command(command, position)

    process_commads(other_commads, position)
  end

  defp process_command(_, nil), do: nil

  defp process_command("MOVE", {x, y, face}) do
    {new_x, new_y} = {x, y, face} |> process_move()

    {new_x, new_y, face}
  end

  defp process_command("RIGHT", {x, y, face}) do
    new_face = face |> process_right()

    {x, y, new_face}
  end

  defp process_command("LEFT", {x, y, face}) do
    new_face = face |> process_left()

    {x, y, new_face}
  end

  defp process_command("REPORT", {x, y, face}) do
    IO.puts("Robot is currently at (#{x}, #{y}) and it's facing #{face}")
  end

  defp process_move({x, y, "NORTH"}) do
    new_x = x + 1

    {new_x, y}
  end

  defp process_move({x, y, "EAST"}) do
    new_y = y + 1

    {x, new_y}
  end

  defp process_move({x, y, "SOUTH"}) do
    new_x = x - 1

    {new_x, y}
  end

  defp process_move({x, y, "WEST"}) do
    new_y = y - 1

    {x, new_y}
  end

  defp process_right("NORTH"), do: "EAST"
  defp process_right("EAST"), do: "SOUTH"
  defp process_right("SOUTH"), do: "WEST"
  defp process_right("WEST"), do: "NORTH"

  defp process_left("NORTH"), do: "WEST"
  defp process_left("WEST"), do: "SOUTH"
  defp process_left("SOUTH"), do: "EAST"
  defp process_left("EAST"), do: "NORTH"
  # de
end
