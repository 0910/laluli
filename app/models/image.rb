class Image < ActiveRecord::Base
  has_attached_file :file, :styles => {:thumb => '120x80>', :small => '480x320>', :medium => '720x480>', :large => '1080x720>', :high => '2440x1627>'}, default_url: "/images/:style/missing.png"
  validates_attachment :file, presence: true, content_type: { content_type: ['image/jpg', 'image/png', 'image/gif', 'image/jpeg'] }
  belongs_to :release
  belongs_to :styling
  belongs_to :interior
  belongs_to :collection
  belongs_to :video
end
