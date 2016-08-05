class AddUsernameIndex < ActiveRecord::Migration
  def change
      # имя должно быть уникальным
      add_index :users, :username, unique: true
  end
end
