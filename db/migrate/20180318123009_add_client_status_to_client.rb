class AddClientStatusToClient < ActiveRecord::Migration[5.1]
  def change
    add_reference :clients, :client_status, foreign_key: true
  end
end
