class RemovePostColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :sub_id
    # remove_index :posts, :sub_id

  end
end
