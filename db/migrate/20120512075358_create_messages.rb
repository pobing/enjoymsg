class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :message_type
      t.datetime :send_time
      t.integer :send_id
      t.integer :from_id

      t.timestamps
    end
  end
end
