class CreateStamps < ActiveRecord::Migration
  def change
    create_table :stamps do |t|
      t.string :country
      t.string :currency
      t.string :subject
      t.string :title
      t.string :subtitle
      t.string :face_value
      t.string :condition
      t.string :image
      t.integer :year

      t.timestamps null: false
    end
  end
end
