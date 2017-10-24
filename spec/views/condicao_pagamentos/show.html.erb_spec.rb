require 'rails_helper'

RSpec.describe "condicoes_pagamento/show", type: :view do
  before(:each) do
    @condicao_pagamento = assign(:condicao_pagamento, CondicaoPagamento.create!(
      :nome => "Nome"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
  end
end
