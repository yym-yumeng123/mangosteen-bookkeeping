class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.bigint :user_id
      t.integer :amount
      t.text :notes
      t.integer :tags_id, array: true, default: []
      t.datetime :happend_at

      t.timestamps
    end
  end
end
