# This migration comes from blorgh (originally 20241007025702)
class CreateBlorghArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :blorgh_articles do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
