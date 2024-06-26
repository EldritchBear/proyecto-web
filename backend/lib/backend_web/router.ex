defmodule BackendWeb.Router do
  alias BackendWeb.SimulacionController
  alias BackendWeb.PersonaController
  alias BackendWeb.RobotController
  alias BackendWeb.SessionsController
  use BackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticate do
    plug BackendWeb.Plugs.Authenticate
  end

  scope "/api", BackendWeb do
    pipe_through [:api, :authenticate]
    resources "/robot", RobotController
    resources "/persona", PersonaController
    resources "/simulacion", SimulacionController
  end

  scope "/sessions" do
    pipe_through :api

    post "/sign_in", SessionsController, :create
    post "/registrar", SessionsController, :new
    delete "/sign_out", SessionsController, :delete
  end

  if Application.compile_env(:backend, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: BackendWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
