class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :name
      t.text :description
      t.string :soundcloud_link
      t.string :beatport_link
      t.string :year

      t.timestamps null: false
    end
  end
end
