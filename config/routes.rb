Rails.application.routes.draw do
  root 'home#index'

  get '/gallery' => 'home#gallery'
  get '/room-packages' => 'home#room_packages'
  get '/program-and-events' => 'home#program_events'
  get '/inquiry' => 'home#inquiry'
  get '/registration' => 'home#registration'
  get '/contact-us' => 'home#contact_us'
  get '/amenities' => 'home#amenities'
  get '/team-building' => 'home#team_building'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
