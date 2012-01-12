Counter::Application.routes.draw do
  resources :patrons, :only => [:index, :create]
  match 'checkin' => "patrons#checkin", :as => :checkin
  root :to => 'patrons#index'
end
