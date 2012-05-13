class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :mobile_phone
      t.string :phone
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :group_id

      t.timestamps
    end
  end
end
