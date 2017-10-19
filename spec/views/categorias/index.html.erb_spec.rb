require 'rails_helper'

RSpec.describe "categorias/index", type: :view do
  before(:each) do
    assign(:categorias, [
      Categoria.create!(
        :nome => "Nome"
      ),
      Categoria.create!(
        :nome => "Nome"
      )
    ])
  end

  it "renders a list of categorias" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
  end
end
