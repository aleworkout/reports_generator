# ReportsGenerator

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `reports_generator` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:reports_generator, "~> 0.1.0"}
  ]
end
```

- Clone this repossitory

```
git clone https://github.com/aleworkout/reports_generator.git
```

- Start using the project

```elixir
iex -S mix
```

- Get an avalaible report as a map

```elixir
ReportsGenerator.build("report_complete")
```

- Get the highest value according the option passed ("users" or "foods")

```elixir
ReportsGenerator.build("report_complete") |> ReportsGenerator.fetch_highest_value("users")
```

- Try passing an invalid option

```elixir
ReportsGenerator.build("report_complete") |> ReportsGenerator.fetch_highest_value("banana")
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/reports_generator](https://hexdocs.pm/reports_generator).

