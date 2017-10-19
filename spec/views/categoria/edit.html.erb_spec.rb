require 'rails_helper'

RSpec.describe "categoria/edit", type: :view do
  before(:each) do
    @categorium = assign(:categorium, Categorium.create!(
      :nome => "MyString",
      :produto => nil
    ))
  end

  it "renders the edit categorium form" do
    render

    assert_select "form[action=?][method=?]", categorium_path(@categorium), "post" do

      assert_select "input[name=?]", "categorium[nome]"

      assert_select "input[name=?]", "categorium[produto_id]"
    end
  end
end
