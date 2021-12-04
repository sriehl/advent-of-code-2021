defmodule AdventOfCode.Day03 do
  @moduledoc false

  defp parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.graphemes/1)
  end

  def part1(input) do
    frequencies =
      input
      |> parse()
      |> Enum.zip()
      |> Enum.map(&Tuple.to_list/1)
      |> Enum.map(&Enum.frequencies/1)
      |> Enum.reduce([], fn
        %{"0" => a, "1" => b}, acc when a > b -> [{0, 1} | acc]
        _, acc -> [{1, 0} | acc]
      end)
      |> Enum.reverse()

    low = frequencies |> Enum.map(&elem(&1, 0)) |> Enum.join("") |> String.to_integer(2)
    high = frequencies |> Enum.map(&elem(&1, 1)) |> Enum.join("") |> String.to_integer(2)

    low * high
  end

  defp most_common_in_tuple(tuple) do
    case tuple do
      %{"0" => a, "1" => b} when a > b -> "0"
      _ -> "1"
    end
  end

  defp most_common_at_position(list, position) do
    list
    |> Enum.map(&Enum.fetch!(&1, position))
    |> Enum.frequencies()
    |> most_common_in_tuple()
  end

  defp most_common(list, position \\ 0)
  defp most_common(list, _) when length(list) == 1, do: Enum.fetch!(list, 0)

  defp most_common(list, position) do
    list
    |> Enum.filter(fn number ->
      Enum.fetch!(number, position) == most_common_at_position(list, position)
    end)
    |> most_common(position + 1)
  end

  defp least_common(list, position \\ 0)
  defp least_common(list, _) when length(list) == 1, do: Enum.fetch!(list, 0)

  defp least_common(list, position) do
    list
    |> Enum.filter(fn number ->
      Enum.fetch!(number, position) != most_common_at_position(list, position)
    end)
    |> least_common(position + 1)
  end

  def part2(input) do
    input = parse(input)

    largest = input |> most_common() |> Enum.join("") |> String.to_integer(2)

    smallest = input |> least_common() |> Enum.join("") |> String.to_integer(2)

    smallest * largest
  end
end
