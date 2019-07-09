class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.timestamps 
      t.string :title, null: false 
      t.text :description, null: false 
      t.integer :user_id, null: false 
    end
    add_index :subs, :user_id
  end
end
