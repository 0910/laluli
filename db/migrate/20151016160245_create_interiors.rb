class CreateInteriors < ActiveRecord::Migration
  def change
    create_table :interiors do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :date

      t.timestamps null: false
    end
  end
end
