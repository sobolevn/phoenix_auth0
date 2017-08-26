defmodule PhoenixAuth0Web.Router do
  use PhoenixAuth0Web, :router

  require Ueberauth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/auth", PhoenixAuth0Web do
    pipe_through [:browser]

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback
    delete "/logout", AuthController, :delete
  end

  scope "/", PhoenixAuth0Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end
end
