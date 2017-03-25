class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.integer  :user_id,            null: false
      t.string   :title,              null: false
      t.text     :body,               null: false
      t.text     :body_html
      t.integer  :last_active_mark

      t.datetime :deleted_at

      t.timestamps
    end

    add_index "topics", ["deleted_at"], name: "index_topics_on_deleted_at"
    add_index "topics", ["last_active_mark"], name: "index_topics_on_last_active_mark"
    add_index "topics", ["user_id"], name: "index_topics_on_user_id"
  end
end
