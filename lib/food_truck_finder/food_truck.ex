defmodule FoodTruckFinder.FoodTruck do
  @moduledoc """
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Helpers

  schema "food_trucks" do
    field :address, :string
    field :applicant, :string
    field :approved, :naive_datetime
    field :block, :string
    field :blocklot, :string
    field :cnn, :integer
    field :days_hours, :string
    field :expiration_date, :naive_datetime
    field :facility_type, :string
    field :food_items, :string
    field :latitude, :float
    field :location, :string
    field :location_description, :string
    field :location_id, :integer
    field :longitude, :float
    field :lot, :string
    field :noi_sent, :naive_datetime
    field :permit, :string
    field :prior_permit, :integer
    field :received, :string
    field :schedule, :string
    field :status, :string
    field :x, :float
    field :y, :float

    timestamps()
  end

  # If there are more than 3 required fields I usually make this a module attribute for readability.
  @required [:location_id, :applicant, :facility_type, :cnn]

  @doc """
  Casting and validation of the data for the food_trucks table.
  """
  def changeset(food_truck, attrs) do
    food_truck
    |> cast(attrs, __MODULE__.__schema__(:fields))
    |> validate_required(@required)
    |> validate_length(:blocklot, max: 20)
    |> validate_length(:block, max: 10)
    |> validate_length(:lot, max: 10)
    |> validate_length(:permit, max: 30)
    |> validate_length(:status, max: 80)
  end

  @doc """
  We need to map json keys to schema keys.
  This function takes in the result of Jason.decode and remaps it using the keys in the food_trucks schema
  While we're at it, we will drop all keys we don't care about.

  Sample Dataset:
  %{
    "address" => "5 THE EMBARCADERO",
    "applicant" => "Ziaurehman Amini",
    "block" => "0234",
    "blocklot" => "0234017",
    "cnn" => "30727000",
    "expirationdate" => "2016-03-15T00:00:00.000",
    "facilitytype" => "Push Cart",
    "latitude" => "37.794331003246846",
    "location" => %{
      "human_address" => "{\"address\": \"\", \"city\": \"\", \"state\": \"\", \"zip\": \"\"}",
      "latitude" => "37.794331003246846",
      "longitude" => "-122.39581105302317"
    },
    "locationdescription" => "MARKET ST: DRUMM ST intersection",
    "longitude" => "-122.39581105302317",
    "lot" => "017",
    "objectid" => "735318",
    "permit" => "15MFF-0159",
    "priorpermit" => "0",
    "received" => "20151231",
    "schedule" => "http://bsm.sfdpw.org/PermitsTracker/reports/report.aspx?title=schedule&report=rptSchedule&params=permit=15MFF-0159&ExportPDF=1&Filename=15MFF-0159_schedule.pdf",
    "status" => "REQUESTED",
    "x" => "6013916.72",
    "y" => "2117244.027"
  }
  """
  def rename_keys(food_trucks) do
    food_trucks
    |> Enum.map(&Map.new(&1, fn
      {"address", value} -> {:address, value}
      {"applicant", value} -> {:applicant, value}
      {"approved", value} -> {:approved, Helpers.parse_naive_time_ecto(value)}
      {"block", value} -> {:block, value}
      {"blocklot", value} -> {:blocklot, value}
      {"cnn", value} -> {:cnn, Helpers.parse_int(value)}
      {"dayshours", value} -> {:days_hours, value}
      {"expirationdate", value} -> {:expiration_date, Helpers.parse_naive_time_ecto(value)}
      {"facilitytype", value} -> {:facility_type, value}
      {"fooditems", value} -> {:food_items, value}
      {"latitude", value} -> {:latitude, Helpers.parse_float(value)}
      {"location", %{"latitude" => latitude, "longitude" => longitude}} -> {:location, ~s(#{latitude}, #{longitude})}
      {"locationdescription", value} -> {:location_description, value}
      {"objectid", value} -> {:location_id, Helpers.parse_int(value)}
      {"longitude", value} -> {:longitude, Helpers.parse_float(value)}
      {"lot", value} -> {:lot, value}
      {"noisent", value} -> {:noi_sent, value}
      {"permit", value} -> {:permit, value}
      {"priorpermit", value} -> {:prior_permit, Helpers.parse_int(value)}
      {"received", value} -> {:received, value}
      {"schedule", value} -> {:schedule, value}
      {"status", value} -> {:status, value}
      {"x", value} -> {:x, Helpers.parse_float(value)}
      {"y", value} -> {:y, Helpers.parse_float(value)}
      {key, value} -> {key, value}
    end))
    |> Enum.map(fn food_truck -> 
      drop_keys = Map.keys(food_truck) -- __MODULE__.__schema__(:fields)
      Map.drop(food_truck, drop_keys)
    end)
  end
end
