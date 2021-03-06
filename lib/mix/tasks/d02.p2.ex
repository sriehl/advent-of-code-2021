defmodule Mix.Tasks.D02.P2 do
  @moduledoc """
  This module implements the D02P2 task.
  """
  use Mix.Task

  import AdventOfCode.Day02

  @shortdoc "Day 02 Part 2"
  def run(args) do
    input = AdventOfCode.Input.get!(2, 2021)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> part2() end}),
      else:
        input
        |> part2()
        # credo:disable-for-next-line Credo.Check.Warning.IoInspect
        |> IO.inspect(label: "Part 2 Results")
  end
end
