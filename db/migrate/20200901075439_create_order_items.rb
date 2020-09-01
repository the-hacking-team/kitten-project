class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.belongs_to :oder, index: true
      t.belongs_to :item, index: true

      t.timestamps
    end
  end
end
