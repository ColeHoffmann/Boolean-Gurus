Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'section/list'
  get 'section/new'
  post 'section/create'
  patch 'section/update'
  get 'section/list'
  get 'section/show'
  get 'section/edit'
  get 'section/delete'
  get 'section/update'
  get 'section/show_subjects'

  get 'course/list'
  get 'course/show'
  
end
