defmodule RadioRestWeb.Router do
  use RadioRestWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/radios", RadioRestWeb do
    pipe_through :api

    resources "/", RadioController, except: [:new, :edit]

    post "/:id", RadioController, :create
    post "/:id/location",RadioController, :update
    get "/:id/location",RadioController, :show
  end
end
