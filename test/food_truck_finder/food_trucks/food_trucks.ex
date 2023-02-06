defmodule FoodTruckFinder.FoodTrucksTest do
  @moduledoc """
  Tests specifically for FoodTruckFinder.FoodTrucks functions.

  ```
  mix test test/food_truck_finder/food_trucks/food_trucks.exs --listen-on-stdin
  ```

  At a minimum, a single test to cover all existing functions in the module.
  """

  use FoodTruckFinder.DataCase, async: true
  alias FoodTruckFinder.FoodTrucks

  describe "module tests" do
    test "add food truck" do
      result =
        FoodTrucks.add_truck(%{
          address: "3065 25TH ST",
          applicant: "Bay Area Mobile Catering, Inc. dba. Taqueria Angelica's",
          approved: ~N[2022-11-22 00:00:00],
          block: "9999",
          blocklot: "4444444",
          cnn: 5_555_000,
          days_hours: "open sometimes. not open others.",
          expiration_date: ~N[2023-11-15 00:00:00],
          facility_type: "Truck",
          food_items: "Tacos: burritos: enchiladas: tostadas:",
          latitude: 37.7509316476402,
          location: "37.7509316476402, -122.4114199662057",
          location_description: "25TH ST: TEXAS ST to SOME OTHER STREET (3042 - 3099)",
          location_id: 9_999_999,
          longitude: -122.4114199662057,
          lot: "038",
          noi_sent: nil,
          permit: "22MFF-00075",
          prior_permit: 1,
          received: "20221118",
          schedule: "some_schedule_listed_here.pdf",
          status: "APPROVED",
          x: 6_009_084.78,
          y: 2_101_536.437
        })

      assert {:ok, _truck} = result
    end

    test "list food trucks" do
      trucks = FoodTrucks.list_food_trucks()
      assert 100 == Enum.count(trucks)
    end

    test "get truck by location id" do
      truck = FoodTrucks.food_truck_by_location_id(1_652_582)
      assert truck.applicant =~ "Off the Grid Services, LLC"
      assert truck.food_items =~ "everything except for hot dogs"
    end
  end
end
