class AddDescriptionToRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :description, :string
  end
end
