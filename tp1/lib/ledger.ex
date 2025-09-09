defmodule Ledger do
  def main(args \\ []) do
    import CLI
    args
    |> parse_args()

  end
end
