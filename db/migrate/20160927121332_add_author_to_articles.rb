class AddAuthorToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :author, :string, default: "Alex"
  end
end
