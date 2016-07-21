class Song < ActiveRecord::Base
	acts_as_taggable_on :tags
	belongs_to :user

	def tag_list
  	tags.map(&:name).join(", ")
	end
end
