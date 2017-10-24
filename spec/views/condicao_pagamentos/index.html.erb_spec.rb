require 'rails_helper'

RSpec.describe "condicoes_pagamento/index", type: :view do
  before(:each) do
    assign(:condicoes_pagamento, [
      CondicaoPagamento.create!(
        :nome => "Nome"
      ),
      CondicaoPagamento.create!(
        :nome => "Nome"
      )
    ])
  end

  it "renders a list of condicoes_pagamento" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
  end
end
