ClockInClockOut::Application.routes.draw do
  root 'employees#index'
  match '/employees_clock_in', to: 'employees#employees_clock_in', via: [:get, :post]
  match '/employees_clock_out', to: 'employees#employees_clock_out', via: [:get, :post]
  resources :employees do
  end
end
