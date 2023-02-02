defmodule FoodTruckFinder.FoodTruck do
  @moduledoc """
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_trucks" do
    field :applicant, :string
    field :location_id, :integer
    field :facility_type, :string
    field :cnn, :integer
    field :location_description, :string
    field :address, :string
    field :blocklot, :string
    field :block, :string
    field :lot, :string
    field :permit, :string
    field :status, :string
    field :food_items, :string
    field :x, :float
    field :y, :float
    field :latitude, :float
    field :longitude, :float
    field :schedule, :string
    field :days_hours, :string
    field :noi_sent, :naive_datetime
    field :approved, :naive_datetime
    field :received, :string
    field :prior_permit, :integer
    field :expiration_date, :naive_datetime
    field :location, :string

    timestamps()
  end

  # If there are more than 3 required fields I usually make this a module attribute for readability.
  @required [:location_id, :applicant, :facility_type, :cnn]

  @doc """
  Casting and validation of the data for the food_trucks table.
  """
  def changeset(food_truck, attrs) do
    food_truck
    |> cast(attrs, [:location_id, :applicant])
    |> validate_required(@required)
    |> validate_length(:blocklot, max: 20)
    |> validate_length(:block, max: 10)
    |> validate_length(:lot, max: 10)
    |> validate_length(:permit, max: 30)
    |> validate_length(:status, max: 80)
  end
end
