ClockInClockOut::Application.routes.draw do
  root 'employees#index'
  match '/employees/clock', to: 'employees#clock', via: [:get, :post]
  resources :employees do
  end
end
