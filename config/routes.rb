ClockInClockOut::Application.routes.draw do
  root 'employees#index'
  match '/employee_clock', to: 'employees#clock', via: [:get, :post]
  resources :employees do
    get :successful_clock
  end
end
