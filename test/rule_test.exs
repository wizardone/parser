defmodule RuleTest do
  use ExUnit.Case
  doctest Router.Rule

  setup do
    Router.Rule.start_agent
  end

  test "add" do
    function = fn(request) -> request end
    Router.Rule.add(:id, function)

    assert Router.Rule.rules == %{id: function}
  end

  test "remove" do
    function = fn(request) -> request end
    Router.Rule.add(:id, function)
    assert Router.Rule.rules == %{id: function}

    Router.Rule.remove(:id)
    assert Router.Rule.rules == %{}
  end

  test "rules" do
    assert Router.Rule.rules == %{}
  end
end
