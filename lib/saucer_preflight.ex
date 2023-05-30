defmodule SaucerPreflight do
  def is_under_max_load?(list) do
    sum =
      list
      |> Enum.map(&EquipmentDetails.item_details(&1))
      |> Enum.map(fn e -> convert_kg_to_lb(elem(e, 0)) * elem(e, 2) end)
      |> Enum.sum()

    sum <= max_flying_load_lbs()
  end

  defp max_flying_load_lbs, do: 55
  defp convert_kg_to_lb(kg_value), do: kg_value * 2.2
end
