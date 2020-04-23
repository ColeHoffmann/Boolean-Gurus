class User < ApplicationRecord
    has_secure_password

    has_many :student_courses, dependent: :destroy

    has_many :applications, dependent: :destroy

end
