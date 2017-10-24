require 'rails_helper'

RSpec.describe "condicoes_pagamento/new", type: :view do
  before(:each) do
    assign(:condicao_pagamento, CondicaoPagamento.new(
      :nome => "MyString"
    ))
  end

  it "renders new condicao_pagamento form" do
    render

    assert_select "form[action=?][method=?]", condicoes_pagamento_path, "post" do

      assert_select "input[name=?]", "condicao_pagamento[nome]"
    end
  end
end
