defmodule Router.Rule do
  @moduledoc """
  Main module that holds information about the router rules
  """
  @on_load :start_agent

  def start_agent do
    # Need this before compile
    Agent.start_link(fn -> %{} end, name: __MODULE__)
    :ok
  end

  def add(id, rule), do: Agent.update(__MODULE__, fn rules -> Map.put(rules, id, rule) end)
  def remove(:id), do: Agent.update(__MODULE__, fn rules -> Map.delete(rules, :id) end)
  def rules, do: Agent.get(__MODULE__, fn rules -> rules end)
end
