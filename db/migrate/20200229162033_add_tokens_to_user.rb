class AddTokensToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :registered_on_showoff, :boolean, :default => false
    add_column :users, :should_update, :boolean, :default => false
    add_column :users, :access_token, :string
    add_column :users, :refresh_token, :string
  end
end
