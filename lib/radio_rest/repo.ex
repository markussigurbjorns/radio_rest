defmodule RadioRest.Repo do
  use Ecto.Repo,
    otp_app: :radio_rest,
    adapter: Ecto.Adapters.Postgres
end
