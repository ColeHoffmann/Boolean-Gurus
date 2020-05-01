class StudentCourse < ApplicationRecord
	belongs_to :user
	validates_format_of :course_number, :with => /\A(\d{4})\z/
	validates_format_of :grade, :with => /\A[A-F](\+|\-)?\z/

end
