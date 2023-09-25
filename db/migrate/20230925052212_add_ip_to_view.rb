class AddIpToView < ActiveRecord::Migration[7.0]
  def change
    add_column :views, :ip, :string
  end
end
