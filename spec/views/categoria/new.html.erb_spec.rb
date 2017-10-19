require 'rails_helper'

RSpec.describe "categoria/new", type: :view do
  before(:each) do
    assign(:categorium, Categorium.new(
      :nome => "MyString",
      :produto => nil
    ))
  end

  it "renders new categorium form" do
    render

    assert_select "form[action=?][method=?]", categoria_path, "post" do

      assert_select "input[name=?]", "categorium[nome]"

      assert_select "input[name=?]", "categorium[produto_id]"
    end
  end
end
