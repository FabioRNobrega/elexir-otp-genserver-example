defmodule ElhexDelivery.PostalCode.Supervisor do
  use Supervisor

  alias ElhexDelivery.PostalCode.{Store, Navigator, Cache}

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      %{
        id: Store,
        start: { Store, :start_link, []}
      },
      %{
        id: Navigator,
        start: { Navigator, :start_link, []}
      },
      %{
        id: Cache,
        start: { Cache, :start_link, []}
      }
    ]
    Supervisor.init(children, strategy: :one_for_one)
  end
end
