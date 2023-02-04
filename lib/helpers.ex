defmodule Helpers do
  @moduledoc """
  General helpers for reuse anywhere
  """

  @doc """
  String.to_integer() can sometimes raise ArgumentError: https://hexdocs.pm/elixir/1.12/String.html#to_integer/1
  """
  def parse_int(value), do: value |> Integer.parse() |> elem(0)

  @doc """
  String.to_float() can sometimes raise ArgumentError: https://hexdocs.pm/elixir/1.12/String.html#to_float/1
  """
  def parse_float(value), do: value |> Float.parse() |> elem(0)

  @doc """
  Bumped into this issue when converting the date for ecto: https://github.com/ZennerIoT/ex_audit/issues/14

  Error in CLI:
  ```
  ** (ArgumentError) :naive_datetime expects microseconds to be empty, got: ~N[2016-03-15 00:00:00.000]
  ```
  """
  def parse_naive_time_ecto(value),
    do: value |> NaiveDateTime.from_iso8601!() |> NaiveDateTime.truncate(:second)
end
