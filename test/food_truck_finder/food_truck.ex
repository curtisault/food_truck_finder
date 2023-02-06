defmodule FoodTruckFinder.FoodTruckTest do
  @moduledoc """
  Tests specifically for FoodTruckFinder.FoodTruck data validation and insertion.

  ```
  mix test test/food_truck_finder/food_trucks/food_trucks.exs --listen-on-stdin
  ```

  At a minimum, test inserting and validation. Normally I'd spend more time adding multiple validation testing.
  """
  use FoodTruckFinder.DataCase, async: true
  alias FoodTruckFinder.FoodTruck

  describe "inserting and validating truck data" do
    test "add truck" do
      truck = %{
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
      }

      changeset = FoodTruck.changeset(%FoodTruck{}, truck)
      assert changeset.valid?
    end

    test "validate required" do
      truck = %{
        address: "3065 25TH ST",
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
      }

      changeset = FoodTruck.changeset(%FoodTruck{}, truck)
      refute changeset.valid?
    end
  end
end
