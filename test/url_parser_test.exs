defmodule ParserTest do
  use ExUnit.Case
  doctest UrlParser

  test "the truth" do
    assert 1 + 1 == 2
  end

  setup do
    UrlParser.Rule.start_agent
  end

  test "parse with no rules" do
    uri = "http://test.com/?search=true"
    assert UrlParser.parse(uri) == {:ok, "No rules added"}
  end

  test "parse single rule successful" do
    function = fn(request) -> String.match?(request, ~r/query/) end
    UrlParser.Rule.add(:query, function)
    uri = "http://test.com/?query=omg"

    assert UrlParser.parse(uri) == [ok: :query]
  end

  test "parse multiple rules successful" do
    function_1 = fn(request) -> String.match?(request, ~r/query/) end
    function_2 = fn(request) -> String.match?(request, ~r/search/) end
    UrlParser.Rule.add(:query, function_1)
    UrlParser.Rule.add(:search, function_2)
    uri = "http://test.com/?query=omg&search=true"

    assert UrlParser.parse(uri) == [ok: :query, ok: :search]
  end

  test "parse unsuccessful" do
    function = fn(request) -> String.match?(request, ~r/query/) end
    UrlParser.Rule.add(:query, function)
    uri = "http://test.com/?search=true"

    assert UrlParser.parse(uri) == [{:not_ok, "Rules do not match"}]
  end
end
