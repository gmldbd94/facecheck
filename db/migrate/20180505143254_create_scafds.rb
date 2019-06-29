class CreateScafds < ActiveRecord::Migration[5.0]
  def change
    create_table :scafds do |t|
      t.string :user_name
      t.integer :birth
      t.string :univ
      t.string :major
      t.string :score
      t.timestamps
    end
  end
end
