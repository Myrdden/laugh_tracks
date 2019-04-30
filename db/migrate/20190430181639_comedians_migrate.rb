class ComediansMigrate < ActiveRecord::Migration[5.1]
  def change
    create_table :comedians do |t|
      t.string :name
      t.integer :age
      t.string :home
      t.string :birthdate
      t.string :birthplace
    end
  end
end
