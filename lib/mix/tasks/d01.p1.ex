defmodule Mix.Tasks.D01.P1 do
  @moduledoc """
  This module implements the D01P1 task.
  """
  use Mix.Task

  import AdventOfCode.Day01

  @shortdoc "Day 01 Part 1"
  def run(args) do
    input = AdventOfCode.Input.get!(1, 2021)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> part1() end}),
      else:
        input
        |> part1()
        # credo:disable-for-next-line Credo.Check.Warning.IoInspect
        |> IO.inspect(label: "Part 1 Results")
  end
end
