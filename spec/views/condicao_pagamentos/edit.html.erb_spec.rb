require 'rails_helper'

RSpec.describe "condicoes_pagamento/edit", type: :view do
  before(:each) do
    @condicao_pagamento = assign(:condicao_pagamento, CondicaoPagamento.create!(
      :nome => "MyString"
    ))
  end

  it "renders the edit condicao_pagamento form" do
    render

    assert_select "form[action=?][method=?]", condicao_pagamento_path(@condicao_pagamento), "post" do

      assert_select "input[name=?]", "condicao_pagamento[nome]"
    end
  end
end
