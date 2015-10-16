class Interior < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
  validates :name, presence: true
  validates :name, uniqueness: true
end
