defmodule RouterTest do
  use ExUnit.Case
  doctest Router

  test "the truth" do
    assert 1 + 1 == 2
  end

  setup do
    Router.Rule.start_agent
  end

  test "parse with no rules" do
    uri = "http://test.com/?search=true"
    assert Router.parse(uri) == "No rules added"
  end

  test "parse successful" do
    function = fn(request) -> String.match?(request, ~r/query/) end
    Router.Rule.add(:query, function)
    uri = "http://test.com/?query=omg"

    assert Router.parse(uri) == :ok
  end

  test "parse unsuccessful" do
    function = fn(request) -> String.match?(request, ~r/query/) end
    Router.Rule.add(:query, function)
    uri = "http://test.com/?search=true"

    assert Router.parse(uri) == :ok
  end
end
