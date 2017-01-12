# Router
[![Build Status](https://travis-ci.org/wizardone/parser.svg?branch=master)](https://travis-ci.org/wizardone/parser)

A small service that parses the whole request body (currently it is working only with the query params), it is meant to run the
whole request against a set of rules (as anonymous functions) and determine where to redirect the
request body.
This is my first ever elixir project, so I intent to extend it more and make it more usable.

## Usage

```elixir
# Start the process, that will hold the rules
UrlParser.Rule.start_agent

# Add some rules
function = fn(request) -> String.match?(request, ~r/query/) end
UrlParser.Rule.add(:query, function)

uri = "http://test.com/?query=omg"
# If the url satisfies the rule
UrlParser.parse(uri)
=> [ok: :query]

# If the url does not satisfy the rule.
UrlParser.parse(uri)
=> [{:not_ok, "Rules do not match"}]
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `url_parser` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:url_parser, "~> 0.1.0"}]
    end
    ```

  2. Ensure `url_parser` is started before your application:

    ```elixir
    def application do
      [applications: [:url_parser]]
    end
    ```

