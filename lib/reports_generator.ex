defmodule ReportsGenerator do
  alias ReportsGenerator.Parser

  @food_names [
    "hambúrguer",
    "açaí",
    "churrasco",
    "pastel",
    "esfirra",
    "pizza",
    "prato_feito",
    "sushi"
  ]

  @options ["users", "foods"]

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  def fetch_highest_value(report, option) when option in @options do
    {:ok, Enum.max_by(report[option], fn {_key, elem} -> elem end)}
  end

  def fetch_highest_value(_report, _option), do: {:error, "Invalid option!"}

  defp sum_values([id, food_name, price], %{"users" => users, "foods" => foods} = report) do
    users = Map.put(users, id, price + users[id])
    foods = Map.put(foods, food_name, foods[food_name] + 1)

    %{report | "users" => users, "foods" => foods}
  end

  defp report_acc do
    users = Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})
    foods = Enum.into(@food_names, %{}, &{&1, 0})

    %{"users" => users, "foods" => foods}
  end
end
