class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string, :after => :id
    add_column :users, :name, :string, :after => :uid
    add_column :users, :gender, :string, :after => :email
  end
end
