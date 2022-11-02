class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :fname
      t.string :ingredients
      t.string :process
      t.string :tag
      t.binary :movie
      t.binary :image
      t.integer :user_id

      t.timestamps
    end
  end
end
