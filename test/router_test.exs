defmodule RouterTest do
  use ExUnit.Case
  doctest Router

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "parse" do
    assert Router.parse == 'Parsing'
  end
end
