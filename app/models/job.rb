class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :category


  include PgSearch
  pg_search_scope :searchme, against: [:title, :body, :location ], :order_within_rank => "jobs.sticky DESC ,jobs.updated_at DESC", using: {:tsearch => {dictionary: "english"}}

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
  after_create :remake_slug


# It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
  	if query.present?
  		searchme(query)
  	else
  		order("jobs.sticky DESC ,jobs.updated_at DESC")
  	end	
  end	

  has_attached_file :image, styles: { medium: "200x200>", thumb: "100x100#" }, default_url: "/medium/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :title,presence: true, length:{maximum:40}
  validates :body, presence: true, length:{minimum:50}
  validates :company, presence: true, length:{maximum:15}
  validates :location, presence: true, length:{maximum:8}
  validates :url, presence: true
  validates :category, presence: true

    def slug_candidates
        [[:id,:title]]
    end

  def remake_slug
    self.update_attribute(:slug, nil)
    self.save!
  end


end
