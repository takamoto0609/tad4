class CreateFields < ActiveRecord::Migration[6.0]
  def change
    create_table :fields do |t|
      t.text       :address,       null: false
      t.float      :latitude
      t.float      :longitude
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
