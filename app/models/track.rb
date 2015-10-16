class Track < ActiveRecord::Base
  belongs_to :release
  validates :name, presence: true
  validates :name, uniqueness: true
end
