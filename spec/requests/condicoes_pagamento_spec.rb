require 'rails_helper'

RSpec.describe "CondicaoPagamentos", type: :request do
  describe "GET /condicoes_pagamento" do
    it "works! (now write some real specs)" do
      get condicoes_pagamento_path
      expect(response).to have_http_status(200)
    end
  end
end
