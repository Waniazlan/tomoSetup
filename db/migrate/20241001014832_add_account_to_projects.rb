class AddAccountToProjects < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :account_id, :integer
    add_index :posts, :account_id
  end
end
