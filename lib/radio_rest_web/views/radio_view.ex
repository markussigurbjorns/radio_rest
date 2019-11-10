defmodule RadioRestWeb.RadioView do
  use RadioRestWeb, :view
  alias RadioRestWeb.RadioView

  def render("index.json", %{radios: radios}) do
    %{data: render_many(radios, RadioView, "radio.json")}
  end

  def render("show.json", %{radio: radio}) do
    %{data: render_one(radio, RadioView, "radio.json")}
  end

  def render("radio.json", %{radio: radio}) do
    %{id: radio.id,
      alias: radio.alias,
      allowed_locations: radio.allowed_locations,
      location: radio.location}
  end
end
