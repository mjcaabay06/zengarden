class AddSidToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :sid, :text
  end
end
