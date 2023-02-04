defmodule FoodTruckFinderWeb.PageController do
  use FoodTruckFinderWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end

  def food_trucks(conn, _params) do
    trucks = FoodTruckFinder.FoodTrucks.list_food_trucks()

    render(conn, :food_trucks, layout: false, trucks: trucks)
  end

  def food_truck_by_location_id(conn, %{"location_id" => location_id}) do
    truck = FoodTruckFinder.FoodTrucks.food_truck_by_location_id(location_id)
    IO.inspect(truck)

    maps_link =
      "https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d48757.49676672817!2d#{truck.longitude}!3d#{truck.latitude}!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMzfCsDQ0JzUwLjQiTiAxMjLCsDI5JzQ2LjYiVw!5e0!3m2!1sen!2sus!4v1675491393600!5m2!1sen!2sus"

    render(conn, :food_truck_info, layout: false, truck: truck, maps_link: maps_link)
  end

  def phoenix(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :phoenix, layout: false)
  end
end
