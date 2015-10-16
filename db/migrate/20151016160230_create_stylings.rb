class CreateStylings < ActiveRecord::Migration
  def change
    create_table :stylings do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :date
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
