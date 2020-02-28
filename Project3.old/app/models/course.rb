class Course < ApplicationRecord
    has_many :sections
    validates_presence_of :courseNumber
    validates_uniqueness_of :courseNumber
end
