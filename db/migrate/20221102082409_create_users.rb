class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :pass
      t.string :mail

      t.timestamps
    end
  end
end
