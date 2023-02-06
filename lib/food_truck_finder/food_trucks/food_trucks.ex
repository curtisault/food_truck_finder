defmodule FoodTruckFinder.FoodTrucks do
  @moduledoc """
  Module for interacting with the food truck data.
  """

  import Ecto.Query

  alias FoodTruckFinder.Repo
  alias FoodTruckFinder.FoodTruck

  @spec add_truck(map()) :: {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}
  def add_truck(food_truck) do
    %FoodTruck{}
    |> FoodTruck.changeset(food_truck)
    |> Repo.insert()
  end

  @spec list_food_trucks() :: [%FoodTruck{}]
  def list_food_trucks() do
    FoodTruck
    |> from(limit: 100)
    |> Repo.all()
  end

  @spec food_truck_by_location_id(integer()) :: %FoodTruck{}
  def food_truck_by_location_id(id) do
    FoodTruck
    |> where(location_id: ^id)
    |> Repo.one()
  end
end
