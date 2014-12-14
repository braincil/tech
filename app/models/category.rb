class Category < ActiveRecord::Base
	has_many :jobs

	#compine name and description attributes
	def name_desc
		"#{name} #{description}"
	end

end
