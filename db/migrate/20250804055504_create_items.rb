class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string        :name,         null: false, default: ""
      t.text          :description,  null: false
      t.integer       :category_id,  null: false, default: 0
      t.integer       :quality_id,   null: false, default: 0
      t.integer       :postage_id,   null: false, default: 0
      t.integer       :prefecture_id, null: false, default: 0
      t.integer       :shipping_day_id, null: false, default: 0
      t.integer       :price,        null: false, default: 0
      t.references    :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
