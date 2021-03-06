defmodule Wally.Project do
  use Wally.Web, :model

  @moduledoc """
  A project is a line on the status board and can have any number of badges,
  which indicate a metric or status of some aspect of the project.
  """

  schema "projects" do
    field :title, :string
    field :settings, Wally.Jsonb.Type
    has_many :badges, Wally.Badge

    timestamps
  end

  @required_fields ~w(title settings)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
