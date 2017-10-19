require 'rails_helper'

RSpec.describe "categoria/show", type: :view do
  before(:each) do
    @categorium = assign(:categorium, Categorium.create!(
      :nome => "Nome",
      :produto => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(//)
  end
end
