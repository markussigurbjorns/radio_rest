defmodule RadioRestWeb.RadioController do
  use RadioRestWeb, :controller

  alias RadioRest.Management
  alias RadioRest.Management.Radio

  action_fallback RadioRestWeb.FallbackController

  def index(conn, _params) do
    radios = Management.list_radios()
    render(conn, "index.json", radios: radios)
  end

  def create(conn, %{"radio" => radio_params}) do
    with {:ok, %Radio{} = radio} <- Management.create_radio(radio_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.radio_path(conn, :show, radio))
      |> render("show.json", radio: radio)
    end
  end

  
  
  def get_location(conn, %{"id" => id, "location" => location}) do
    if location != nil do
     radio = Management.get_location(id)
     render(conn, "show.json", radio: radio)
    end
  end  

  def show(conn, %{"id" => id}) do
    radio = Management.get_radio!(id)
    render(conn, "show.json", radio: radio)
  end

  def update(conn, %{"id" => id, "radio" => radio_params}) do
    radio = Management.get_radio!(id)

    with {:ok, %Radio{} = radio} <- Management.update_radio(radio, radio_params) do
      render(conn, "show.json", radio: radio)
    end
  end

  def delete(conn, %{"id" => id}) do
    radio = Management.get_radio!(id)

    with {:ok, %Radio{}} <- Management.delete_radio(radio) do
      send_resp(conn, :no_content, "")
    end
  end
end
