class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :soundcloud_link
      t.string :beatport_link
      t.references :release, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
