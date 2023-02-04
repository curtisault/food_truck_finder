defmodule FoodTruckFinder.Repo.Migrations.PopulateFoodTrucksTable do
  @moduledoc """
  The purpose of this migraiton is to populate the table is current data found in `priv/static/data/rqjz-sfat.json`

  You can see the decoded output of this data using Jason:

  ```
  iex -S mix

  file_path = "priv/static/data/rqjz-sfat.json"
  {:ok, data} = file_path |> File.read! |> Jason.decode
  ```

  Use hd() to have visualization of the format of this data:
  ```
  hd(data)
  ```
  """

  use Ecto.Migration

  alias FoodTruckFinder.FoodTruck
  alias FoodTruckFinder.Repo

  def change do
    case get_file_data() do
      {:ok, data} ->
        data
        |> FoodTruck.rename_keys()
        |> (&Repo.insert_all(FoodTruck, &1)).()
      err ->
        err
    end
  end

  # Decode the file data. Mainly capture errors and log here.
  # In the real world, I would have a module that would call the open API to get this data in real time.
  # Using a static file for the sake of time.
  defp get_file_data() do
    case decode_file() do
      {:error, %Jason.DecodeError{data: reason} = decode_err} ->
        # Usually you would log here
        IO.puts(reason)
        {:error, decode_err}

      {:ok, data} ->
        {:ok, data}
    end
  end

  @file_path "priv/static/data/rqjz-sfat.json"

  # Helper function focused on purely decoding a json file.
  def decode_file(), do: @file_path |> File.read!() |> Jason.decode()
end
