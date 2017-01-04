defmodule Router do
  def parse(request) do
    rules = Router.Rule.rules
    uri = URI.parse(request)
    Enum.each(rules, fn({_k, v}) ->
      if v.(uri) do
        :ok
      else
        :not_ok
      end
    end
    )
  end
end
