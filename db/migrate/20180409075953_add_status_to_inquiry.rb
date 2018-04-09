class AddStatusToInquiry < ActiveRecord::Migration[5.1]
  def change
    add_reference :inquiries, :status, foreign_key: true
  end
end
