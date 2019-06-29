class AddImageToScafds < ActiveRecord::Migration[5.0]
  def change
    add_column :scafds, :image, :string
  end
end
