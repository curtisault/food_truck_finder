defmodule FoodTruckFinderWeb.PageControllerTest do
  @moduledoc """
  To run tests

  ```
  mix test
  ```

  Although, during developement I prefer a more sophistocated approach:

  ```
  mix test test/food_truck_finder_web/controllers/page_controller_test.exs --listen-on-stdin
  ```

  This allows me to modify as much as I want then go back and hit "ENTER" to rerun all tests in this module specifically.
  """
  use FoodTruckFinderWeb.ConnCase

  describe "GET" do
    test "home", %{conn: conn} do
      conn = get(conn, ~p"/")
      assert html_response(conn, 200) =~ "Food Truck Selection"
      assert html_response(conn, 200) =~ "Show Trucks"
    end

    test "foodtrucks", %{conn: conn} do
      conn = get(conn, ~p"/foodtrucks")
      assert html_response(conn, 200) =~ "Pick a Truck!"

      assert html_response(conn, 200) =~
               "Select a truck by clicking on the name of one that is of interest."
    end

    test "foodtrucks_by_location_id", %{conn: conn} do
      conn = get(conn, ~p"/foodtrucks/1652582")
      assert html_response(conn, 200) =~ "Off the Grid Services, LLC"
    end

    test "phoenix", %{conn: conn} do
      conn = get(conn, ~p"/phoenix")
      assert html_response(conn, 200) =~ "Peace of mind from prototype to production"
    end
  end
end
