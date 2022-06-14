defmodule ElhexDelivery.PostalCode.Supervisor do
  use Supervisor

  alias ElhexDelivery.PostalCode.{Store, Navigator, Cache}

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  def init(_) do
    children = [
      %{
        id: Store,
        start: { Store, :start_link, []},
        shutdown: :infinity,
        type: :supervisor
      },
      %{
        id: Navigator,
        start: { Navigator, :start_link, []},
        shutdown: :infinity,
        type: :supervisor
      },
      %{
        id: Cache,
        start: { Cache, :start_link, []},
        shutdown: :infinity,
        type: :supervisor
      }
    ]
    Supervisor.init(children, strategy: :one_for_one)
  end
end
