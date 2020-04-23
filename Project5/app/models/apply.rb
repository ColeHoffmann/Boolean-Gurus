class Apply < ApplicationRecord
	validates_uniqueness_of :email
	validates_format_of :course_number, :with => /\A(\d{4},)*(\d{4})\z/
	validates_format_of :schedule, :with => /\A((\d{2}:\d{2}-\d{2}:\d{2},)*(\d{2}:\d{2}-\d{2}:\d{2});){0,5}\z/

	belongs_to :user
end
