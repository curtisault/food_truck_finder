defmodule FoodTruckFinder.FoodTrucks do
  @moduledoc """
  Module for interacting with the food truck data.
  """

  import Ecto.Query
  
  alias FoodTruckFinder.Repo
  alias FoodTruckFinder.FoodTruck

  def list_food_trucks() do
    from(FoodTruck, limit: 50)
    |> Repo.all()
  end

  def food_truck_by_location_id(id) do
    FoodTruck
    |> where(location_id: ^id)
    |> Repo.one()
  end
end
