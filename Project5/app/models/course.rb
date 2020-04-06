class Course < ApplicationRecord
  	def self.create_from_collection(hash_list)
    	hash_list.each do |course_hash|
      	Course.create(course_hash)
    	end
	end
end
