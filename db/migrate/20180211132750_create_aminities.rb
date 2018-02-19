class CreateAminities < ActiveRecord::Migration[5.1]
  def change
    create_table :aminities do |t|
      t.string :description

      t.timestamps
    end
  end
end
