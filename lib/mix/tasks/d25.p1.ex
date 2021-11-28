defmodule Mix.Tasks.D25.P1 do
  @moduledoc """
  This module implements the D25P1 task.
  """
  use Mix.Task

  import AdventOfCode.Day25

  @shortdoc "Day 25 Part 1"
  def run(args) do
    input = nil

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> part1() end}),
      else:
        input
        |> part1()
        # credo:disable-for-next-line Credo.Check.Warning.IoInspect
        |> IO.inspect(label: "Part 1 Results")
  end
end
