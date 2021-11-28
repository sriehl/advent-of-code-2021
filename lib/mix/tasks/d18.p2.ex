defmodule Mix.Tasks.D18.P2 do
  @moduledoc """
  This module implements the D18P2 task.
  """
  use Mix.Task

  import AdventOfCode.Day18

  @shortdoc "Day 18 Part 2"
  def run(args) do
    input = nil

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> part2() end}),
      else:
        input
        |> part2()
        # credo:disable-for-next-line Credo.Check.Warning.IoInspect
        |> IO.inspect(label: "Part 2 Results")
  end
end
