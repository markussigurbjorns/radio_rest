defmodule RadioRest.Management.Radio do
  use Ecto.Schema
  import Ecto.Changeset

  schema "radios" do
    field :alias, :string
    field :allowed_locations, {:array, :string}
    field :location, :string

    timestamps()
  end

  @doc false
  def changeset(radio, attrs) do
    radio
    |> cast(attrs, [:alias, :allowed_locations, :location])
    |> validate_required([:alias, :allowed_locations])
    |> unique_constraint(:alias)
    |> validate_allowed_location()
  end

  def check_if_location(radio, attrs) do
    radio
    |> is_loc_nil
  end

  def is_loc_nil(changeset) do
    location = get_field(changeset, :location)
    location == nil
  end

  def validate_allowed_location(changeset) do
    location = get_field(changeset, :location)
    allowed_locations = get_field(changeset, :allowed_locations)

    if location in allowed_locations or location == nil do
      changeset
    else
      add_error(changeset, :location, "location is not allowed")
      end
  end
end
