defmodule Rocketpay.NumbersTest do
  use ExUnit.Case

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "when has file with the given name, returns the sum of numbers" do
      response = Numbers.sum_from_file("numbers")
      expected_response = {:ok, %{result: 37}}
      assert response == expected_response
    end

    test "when has no file with the given name, returns the sum of numbers" do
      response = Numbers.sum_from_file("banana")
      expected_response =  {:error, %{message: "Invalid file"}}
      assert response == expected_response
    end
  end

end
