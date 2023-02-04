defmodule FoodTruckFinderWeb.FoodTruckController do
  use FoodTruckFinderWeb, :controller

  def index(conn, params) do
    dbg(params)

    render(conn, :home, layout: false)
  end
end
