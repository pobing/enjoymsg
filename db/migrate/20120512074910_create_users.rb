class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.integer :group_id
      t.string :email
      t.string :company
      t.string :job_title

      t.timestamps
    end
  end
end
