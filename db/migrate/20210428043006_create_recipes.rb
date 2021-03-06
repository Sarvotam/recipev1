class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.integer :view_count
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
