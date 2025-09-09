defmodule CLITest do
  use ExUnit.Case
  import CLI
  doctest CLI

  test "parse args with invalid option shuld raise ParserError" do
    args = ["transacciones", "-t=transac.csv", "-c1=345", "--invalid=123"]
    assert_raise OptionParser.ParseError, fn -> parse_args(args) end
  end

  test "parse valid args with rest" do
    args = ["transacciones", "-t=transac.csv", "-c1=345"]
    assert parse_args(args) == {[t: "transac.csv", c1: 345], ["transacciones"]}
  end

  test "parse valid args with only flags" do
    args = ["-t=transac.csv", "-c1=345", "-c2=456", "-o=result.csv"]
    assert parse_args(args) == {[t: "transac.csv", c1: 345, c2: 456, o: "result.csv"],[]}
  end
end
