class Section < ApplicationRecord
    belongs_to :course,
        foreign_key: 'courseNumber'
    validates_presence_of :sectionNumber
end
