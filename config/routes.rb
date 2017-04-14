Rails.application.routes.draw do
  resources :members, :departments, :employees

  get 'departments/index'
  get 'departments/new'
  post 'departments/new'
  get 'members/index'
  get 'welcome/index'
  post 'employees/new'
  post 'welcome/index'


  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
