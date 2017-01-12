# Router
[![Build Status](https://travis-ci.org/wizardone/parser.svg?branch=master)](https://travis-ci.org/wizardone/parser)

A small service that parses the whole request body, it is meant to run the
whole request against a set of rules and determine where to redirect the
request body.

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

