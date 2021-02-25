defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read
    |> handle_file
    # file = File.read("#{filename}.csv")
    # handle_file(file)
  end

  # defp handle_file({:ok, file}), do: file
  defp handle_file({:ok, result}) do
    # result = String.split(result, ",")
    # result = Enum.map(result, fn number -> String.to_integer(number) end)
    # result = Enum.sum(result)
    # Usando pipe
    result =
      result
      |> String.split(",")
      # |> Enum.map(fn number -> String.to_integer(number) end)
      |> Stream.map(fn number -> String.to_integer(number) end)
      |> Enum.sum
    {:ok, %{result: result}}
  end

  defp handle_file({:error, _error}), do: { :error, %{ message: "Invalid file" }}
end
