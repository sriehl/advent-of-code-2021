defmodule AdventOfCode.Day01 do
  @moduledoc false

  defp format_input(input) do
    input
    |> String.trim()
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  defp count_increase(input) do
    input
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [a, b] -> a < b end)
  end

  @spec part1(String.t()) :: integer()
  def part1(input) do
    input
    |> format_input()
    |> count_increase()
  end

  @spec part2(String.t()) :: integer()
  def part2(input) do
    input
    |> format_input()
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
    |> count_increase()
  end
end
