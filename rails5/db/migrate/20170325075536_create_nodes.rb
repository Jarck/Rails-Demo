class CreateNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :nodes do |t|
      t.string :name            # 英文名
      t.string :title           # 显示名称
      t.boolean :publish, default: false

      t.timestamps
    end
  end
end
