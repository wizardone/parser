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
    assert Router.parse(uri) == {:ok, "No rules added"}
  end

  test "parse single rule successful" do
    function = fn(request) -> String.match?(request, ~r/query/) end
    Router.Rule.add(:query, function)
    uri = "http://test.com/?query=omg"

    assert Router.parse(uri) == [ok: :query]
  end

  test "parse multiple rules successful" do
    function_1 = fn(request) -> String.match?(request, ~r/query/) end
    function_2 = fn(request) -> String.match?(request, ~r/search/) end
    Router.Rule.add(:query, function_1)
    Router.Rule.add(:search, function_2)
    uri = "http://test.com/?query=omg&search=true"

    assert Router.parse(uri) == [ok: :query, ok: :search]
  end

  test "parse unsuccessful" do
    function = fn(request) -> String.match?(request, ~r/query/) end
    Router.Rule.add(:query, function)
    uri = "http://test.com/?search=true"

    assert Router.parse(uri) == [{:not_ok, "Rules do not match"}]
  end
end
