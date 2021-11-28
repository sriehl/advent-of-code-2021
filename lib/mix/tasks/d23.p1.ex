defmodule Mix.Tasks.D23.P1 do
  @moduledoc """
  This module implements the D23P1 task.
  """
  use Mix.Task

  import AdventOfCode.Day23

  @shortdoc "Day 23 Part 1"
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
