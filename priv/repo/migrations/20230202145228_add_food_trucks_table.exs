defmodule FoodTruckFinder.Repo.Migrations.AddFoodTrucksTable do
  @moduledoc """
  API spec can be found here: 
    https://www.opendatanetwork.com/dataset/data.sfgov.org/rqzj-sfat

  Check if this migration has been ran or not yet:
    ```
    mix ecto.migrations
    ```

  If you need to run this migration:
    ```
    mix ecto.migrate
    ```
  """

  use Ecto.Migration


  @table_name "food_trucks"

  def up do
    create_table(@table_name)
  end

  def down do
    drop table(@table_name)
  end

  defp create_table(table_name) do
    create table(table_name) do
      add :location_id, :integer, null: false
      add :applicant, :string, null: false
      add :facility_type, :string, null: false
      add :cnn, :integer, null: false
      add :location_description, :string
      add :address, :string
      add :blocklot, :string, size: 20
      add :block, :string, size: 10
      add :lot, :string, size: 10
      add :permit, :string, size: 30
      add :status, :string, size: 80
      add :food_items, :string
      add :x, :float
      add :y, :float
      add :latitude, :float
      add :longitude, :float
      add :schedule, :string
      add :days_hours, :string
      add :noi_sent, :string
      add :approved, :naive_datetime
      add :received, :string
      add :prior_permit, :integer
      add :expiration_date, :naive_datetime
      add :location, :string

      timestamps()
    end
  end
end
