class CreateClientStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :client_statuses do |t|
      t.string :description

      t.timestamps
    end
  end
end
