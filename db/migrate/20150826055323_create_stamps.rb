class CreateStamps < ActiveRecord::Migration
  def change
    create_table :stamps do |t|
      t.string :subject
      t.string :title
      t.string :subtitle
      t.integer :year
      t.integer :country_id
      t.integer :currency_id
      t.integer :condition_id
      t.integer :user_id
      t.text :country_stamps, array: true, defualt: []
      t.text :subject_stamps, array: true, defualt: []
      t.float :face_value

      t.timestamps null: false
    end
  end
end
