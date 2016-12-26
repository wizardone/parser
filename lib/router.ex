defmodule Router do
  import Router.Rule

  def parse(req) do
    # TODO: Need some unique identifier, for the incoming request
    # Maybe a http header or the body format/options?
    rules = Router.Rule.rules
  end
end
