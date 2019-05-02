class SpecialsMigrate < ActiveRecord::Migration[5.1]
  def change
    create_table :specials do |t|
      t.references :comedian
      t.string :name
      t.integer :runtime
      t.string :date
      t.string :location
    end
  end
end
