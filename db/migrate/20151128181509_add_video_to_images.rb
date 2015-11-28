class AddVideoToImages < ActiveRecord::Migration
  def change
    add_reference :images, :video, index: true, foreign_key: true
  end
end
