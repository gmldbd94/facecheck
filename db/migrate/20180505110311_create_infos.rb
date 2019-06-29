class CreateInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :infos do |t|
      t.string :user_name
      t.integer :birth
      t.string :univ
      t.string :major

      t.timestamps
    end
  end
end
