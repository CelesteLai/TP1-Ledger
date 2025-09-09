defmodule CLI do
  def parse_args(args) do
    change_args(args)
    |> OptionParser.parse!(strict: [c1: :integer, c2: :integer, t: :string, m: :integer, o: :string])
  end
  #cuanta origen y cuenta destino es string o int?

  defp change_args(args) do
    Enum.map(args, fn arg ->
      case arg do
        "--" <> _rest -> arg
        "-" <> rest -> "--" <> rest
        other -> other
      end
    end)
  end

end
