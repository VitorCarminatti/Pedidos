class AddAttachmentFotoToProdutos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :produtos do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :produtos, :foto
  end
end
