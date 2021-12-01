defmodule Mix.Tasks.D01.P2 do
  @moduledoc """
  This module implements the D01P2 task.
  """
  use Mix.Task

  import AdventOfCode.Day01

  @shortdoc "Day 01 Part 2"
  def run(args) do
    input = AdventOfCode.Input.get!(1, 2021)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> part2() end}),
      else:
        input
        |> part2()
        # credo:disable-for-next-line Credo.Check.Warning.IoInspect
        |> IO.inspect(label: "Part 2 Results")
  end
end
