json.extract! course, :id, :title, :section_number, :component, :location, :time, :instructor, :session, :created_at, :updated_at
json.url course_url(course, format: :json)
