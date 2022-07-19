class AddDescriptionToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :description, :text
    #what to add, in which table, name of column add, type 
  end
end
