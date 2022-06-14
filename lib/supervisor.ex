defmodule ElhexDelivery.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      %{
        id: ElhexDelivery.PostalCode.Supervisor,
        start: { ElhexDelivery.PostalCode.Supervisor, :start_link, []},
        shutdown: :infinity,
        type: :supervisor
      }
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
