defmodule Router do

  def parse(request) do
    # TODO: Need some unique identifier, for the incoming request
    # Maybe a http header or the body format/options?
    rules = Router.Rule.rules
    URI.parse(request)
    # String.match?
  end
end
