defmodule Mix.Tasks.D02.P1 do
  @moduledoc """
  This module implements the D02P1 task.
  """
  use Mix.Task

  import AdventOfCode.Day02

  @shortdoc "Day 02 Part 1"
  def run(args) do
    input = AdventOfCode.Input.get!(2, 2021)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> part1() end}),
      else:
        input
        |> part1()
        # credo:disable-for-next-line Credo.Check.Warning.IoInspect
        |> IO.inspect(label: "Part 1 Results")
  end
end
