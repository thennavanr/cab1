Rails.application.routes.draw do

#  resources :special_requests
  get 'offers/show'
  get 'services/show'

  get 'about/show'
  get 'terms_and_conditions/show'

  root 'home#new'

  resources :reservations
  resources :contacts
  resources :about
  resources :home
  resources :services
  resources :offers
  resources :payment_notifications 

  get 'sitemap.xml', :to => 'sitemap#index', :defaults => { :format => 'xml' }

  get '/robots.:format' => 'sites#robots'

  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end

end
