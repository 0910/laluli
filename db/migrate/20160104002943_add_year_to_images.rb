class AddYearToImages < ActiveRecord::Migration
  def change
  	add_column :images, :year, :integer
  end
end
