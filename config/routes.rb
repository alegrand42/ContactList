Rails.application.routes.draw do
	devise_for :users
	resources :contacts, only: [:index, :create, :destroy, :search, :show, :update, :edit]
	
	get 'static_pages/home'
	get 'static_pages/help'
	get '/repertory', to: 'contacts#search'

	root 'static_pages#home'
end
