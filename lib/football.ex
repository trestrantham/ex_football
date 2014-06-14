defmodule Football do
  use Application

  def start(_type, _args) do
    Football.Supervisor.start_link
  end
end

defmodule Football.Supervisor do
  use Supervisor

  def start_link do
    :supervisor.start_link({ :local, __MODULE__ }, __MODULE__, [])
  end

  def init([]) do
    tree = [worker(Repo, [])]
    supervise(tree, strategy: :one_for_all)
  end
end
