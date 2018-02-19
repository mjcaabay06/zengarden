class CreateInquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :inquiries do |t|
      t.references :client, foreign_key: true
      t.date :event_date
      t.references :event, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
