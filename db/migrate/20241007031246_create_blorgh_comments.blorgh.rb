# This migration comes from blorgh (originally 20241007030251)
class CreateBlorghComments < ActiveRecord::Migration[7.2]
  def change
    create_table :blorgh_comments do |t|
      t.integer :article_id
      t.text :text

      t.timestamps
    end
  end
end
