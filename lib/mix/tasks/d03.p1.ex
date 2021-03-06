defmodule Mix.Tasks.D03.P1 do
  @moduledoc """
  This module implements the D03P1 task.
  """
  use Mix.Task

  import AdventOfCode.Day03

  @shortdoc "Day 03 Part 1"
  def run(args) do
    input = AdventOfCode.Input.get!(3, 2021)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> part1() end}),
      else:
        input
        |> part1()
        # credo:disable-for-next-line Credo.Check.Warning.IoInspect
        |> IO.inspect(label: "Part 1 Results")
  end
end
