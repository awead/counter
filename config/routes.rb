Counter::Application.routes.draw do
  resources :patrons, :only => [:index, :create]
  match 'checkin'  => "patrons#checkin", :as => :checkin
  match 'download' => "patrons#download", :as => :download
  root :to => 'patrons#checkin'
end
