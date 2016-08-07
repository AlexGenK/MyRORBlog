class AddUsername < ActiveRecord::Migration
  def change
    # добавляем имя пользователя
    add_column :users, :username, :string
  end
end
