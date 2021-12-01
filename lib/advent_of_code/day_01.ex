defmodule AdventOfCode.Day01 do
  @moduledoc false

  defp check_for_increase(readings, count \\ 0)
  defp check_for_increase([], count), do: count
  defp check_for_increase([_current | rest], count) when rest == [], do: count

  defp check_for_increase([current | rest], count) do
    if current < List.first(rest) do
      check_for_increase(rest, count + 1)
    else
      check_for_increase(rest, count)
    end
  end

  @spec part1(String.t()) :: integer()
  def part1(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
    |> check_for_increase()
  end

  @spec part2(String.t()) :: integer()
  def part2(input) do
    depths =
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&String.to_integer/1)

    0
  end
end
