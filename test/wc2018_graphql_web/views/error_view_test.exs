defmodule Wc2018GraphqlWeb.ErrorViewTest do
  use Wc2018GraphqlWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json" do
    assert render(Wc2018GraphqlWeb.ErrorView, "404.json", []) ==
           %{errors: %{detail: "Not Found"}}
  end

  test "renders 500.json" do
    assert render(Wc2018GraphqlWeb.ErrorView, "500.json", []) ==
           %{errors: %{detail: "Internal Server Error"}}
  end
end
