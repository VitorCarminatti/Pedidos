require 'rails_helper'

RSpec.describe "categorias/edit", type: :view do
  before(:each) do
    @categoria = assign(:categoria, Categoria.create!(
      :nome => "MyString"
    ))
  end

  it "renders the edit categoria form" do
    render

    assert_select "form[action=?][method=?]", categoria_path(@categoria), "post" do

      assert_select "input[name=?]", "categoria[nome]"
    end
  end
end
