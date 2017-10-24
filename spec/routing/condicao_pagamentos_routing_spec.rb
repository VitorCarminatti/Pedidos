require "rails_helper"

RSpec.describe CondicaoPagamentosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/condicoes_pagamento").to route_to("condicoes_pagamento#index")
    end

    it "routes to #new" do
      expect(:get => "/condicoes_pagamento/new").to route_to("condicoes_pagamento#new")
    end

    it "routes to #show" do
      expect(:get => "/condicoes_pagamento/1").to route_to("condicoes_pagamento#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/condicoes_pagamento/1/edit").to route_to("condicoes_pagamento#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/condicoes_pagamento").to route_to("condicoes_pagamento#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/condicoes_pagamento/1").to route_to("condicoes_pagamento#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/condicoes_pagamento/1").to route_to("condicoes_pagamento#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/condicoes_pagamento/1").to route_to("condicoes_pagamento#destroy", :id => "1")
    end

  end
end
