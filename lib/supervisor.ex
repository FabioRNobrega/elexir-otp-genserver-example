defmodule ElhexDelivery.Supervisor do
  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  def init(_init_arg) do
    children = [
      # This is the shortcut for
      # %{
      #   id: ElhexDelivery.PostalCode.Supervisor,
      #   start: { ElhexDelivery.PostalCode.Supervisor, :start_link, [[]]},
      #   shutdown: :infinity,
      #   type: :supervisor
      # }
      # See the implementation of child_spec/1 at
      # https://github.com/elixir-lang/elixir/blob/7e4fbe657dbf9c3e19e3d2bd6c17cc6d724b4710/lib/elixir/lib/supervisor.ex#L456-L464
      {ElhexDelivery.PostalCode.Supervisor, []}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
