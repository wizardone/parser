defmodule Router do
  def parse(request) do
    rules = Router.Rule.rules
    cond do
      Enum.empty?(rules) ->
        "No rules added"
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
