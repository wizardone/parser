defmodule RouterTest do
  use ExUnit.Case
  doctest Router

  setup do
    Router.Rule.start_agent
    function = fn(request) -> request end
    Router.Rule.add(:id, function)
  end

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "parse" do
    query = '?some_param=param'
    Router.parse(query)
  end
end
