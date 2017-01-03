defmodule RouterTest do
  use ExUnit.Case
  doctest Router

  setup do
    Router.Rule.start_agent
    function = fn(request) -> request end
    Router.Rule.add(:query, function)
  end

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "parse" do
    uri = "http://test.com/?query=omg"
    Router.parse(uri)
  end
end
