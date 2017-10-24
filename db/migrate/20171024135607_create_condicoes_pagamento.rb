class CreateCondicoesPagamento < ActiveRecord::Migration[5.1]
  def change
    create_table :condicoes_pagamento do |t|
      t.string :nome

      t.timestamps
    end
  end
end
