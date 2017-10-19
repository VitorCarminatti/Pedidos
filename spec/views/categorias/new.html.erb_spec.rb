require 'rails_helper'

RSpec.describe "categorias/new", type: :view do
  before(:each) do
    assign(:categoria, Categoria.new(
      :nome => "MyString"
    ))
  end

  it "renders new categoria form" do
    render

    assert_select "form[action=?][method=?]", categorias_path, "post" do

      assert_select "input[name=?]", "categoria[nome]"
    end
  end
end
