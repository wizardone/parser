defmodule RuleTest do
  use ExUnit.Case
  doctest UrlParser.Rule

  setup do
    UrlParser.Rule.start_agent
  end

  test "add" do
    function = fn(request) -> request end
    UrlParser.Rule.add(:id, function)

    assert UrlParser.Rule.rules == %{id: function}
  end

  test "remove" do
    function = fn(request) -> request end
    UrlParser.Rule.add(:id, function)
    assert UrlParser.Rule.rules == %{id: function}

    UrlParser.Rule.remove(:id)
    assert UrlParser.Rule.rules == %{}
  end

  test "rules" do
    assert UrlParser.Rule.rules == %{}
  end
end
