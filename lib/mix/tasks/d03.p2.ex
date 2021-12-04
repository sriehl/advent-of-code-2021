defmodule Mix.Tasks.D03.P2 do
  @moduledoc """
  This module implements the D03P2 task.
  """
  use Mix.Task

  import AdventOfCode.Day03

  @shortdoc "Day 03 Part 2"
  def run(args) do
    input = AdventOfCode.Input.get!(3, 2021)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> part2() end}),
      else:
        input
        |> part2()
        # credo:disable-for-next-line Credo.Check.Warning.IoInspect
        |> IO.inspect(label: "Part 2 Results")
  end
end
