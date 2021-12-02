defmodule AdventOfCode.Day02 do
  @moduledoc false

  defp parse_input(input) do
    input
    |> String.trim()
    |> String.split()
    |> Enum.chunk_every(2, 2)
    |> Enum.map(fn [direction, distance] ->
      %{direction: direction, distance: String.to_integer(distance)}
    end)
  end

  defp p1_navigate(instructions, location \\ %{horizontal: 0, depth: 0})
  defp p1_navigate([], location), do: location

  defp p1_navigate([%{direction: "forward", distance: distance} | rest], location) do
    p1_navigate(rest, %{horizontal: location.horizontal + distance, depth: location.depth})
  end

  defp p1_navigate([%{direction: "up", distance: distance} | rest], location) do
    p1_navigate(rest, %{horizontal: location.horizontal, depth: location.depth - distance})
  end

  defp p1_navigate([%{direction: "down", distance: distance} | rest], location) do
    p1_navigate(rest, %{horizontal: location.horizontal, depth: location.depth + distance})
  end

  @spec part1(String.t()) :: integer()
  def part1(input) do
    location =
      input
      |> parse_input()
      |> p1_navigate()

    location.depth * location.horizontal
  end

  defp p2_navigate(instructions, location \\ %{horizontal: 0, depth: 0, aim: 0})
  defp p2_navigate([], location), do: location

  defp p2_navigate([%{direction: "forward", distance: distance} | rest], location) do
    p2_navigate(rest, %{
      horizontal: location.horizontal + distance,
      depth: location.depth + location.aim * distance,
      aim: location.aim
    })
  end

  defp p2_navigate([%{direction: "up", distance: distance} | rest], location) do
    p2_navigate(rest, %{
      horizontal: location.horizontal,
      depth: location.depth,
      aim: location.aim - distance
    })
  end

  defp p2_navigate([%{direction: "down", distance: distance} | rest], location) do
    p2_navigate(rest, %{
      horizontal: location.horizontal,
      depth: location.depth,
      aim: location.aim + distance
    })
  end

  @spec part2(String.t()) :: integer()
  def part2(input) do
    location =
      input
      |> parse_input()
      |> p2_navigate()

    location.depth * location.horizontal
  end
end
