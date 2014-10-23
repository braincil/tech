class Job < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x250#", thumb: "100x100#" }, default_url: "/medium/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :title,presence: true, length:{maximum:15}
  validates :body, presence: true, length:{minimum:50}
  validates :company, presence: true, length:{maximum:15}
  validates :location, presence: true, length:{maximum:8}

end
