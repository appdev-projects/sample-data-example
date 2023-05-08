class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state_short
      t.string :state_full

      t.timestamps
    end
  end
end
