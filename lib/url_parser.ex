defmodule UrlParser do
  def parse(request) do
    rules = UrlParser.Rule.rules
    cond do
      Enum.empty?(rules) ->
        {:ok, "No rules added"}
      !Enum.empty?(rules) ->
        uri = URI.parse(request)
        Enum.map(rules, fn({k, v}) ->
          if v.(uri.query) do
            {:ok, k}
          else
            {:not_ok, "Rules do not match"}
          end
        end
        )
    end
  end
end
