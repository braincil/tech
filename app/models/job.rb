class Job < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search, against: [:title, :body, :location ], :order_within_rank => "jobs.sticky DESC ,jobs.updated_at DESC", using: {:tsearch => {dictionary: "english"}}

# It returns the articles whose titles contain one or more words that form the query
  def search(query)
  	if query.present?
  		search(query)
  	else
  		render 'index'
  	end	
  end	

  has_attached_file :image, styles: { medium: "300x250#", thumb: "100x100#" }, default_url: "/medium/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :title,presence: true, length:{maximum:25}
  validates :body, presence: true, length:{minimum:50}
  validates :company, presence: true, length:{maximum:15}
  validates :location, presence: true, length:{maximum:8}


end
