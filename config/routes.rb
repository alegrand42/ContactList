Rails.application.routes.draw do
	get 'tags/:tag', to: 'contacts#search', as: :tag
	devise_for :users
	resources :contacts, only: [:index, :create, :destroy, :search, :show, :update, :edit]
	
	get 'static_pages/home'
	get 'static_pages/help'
	get '/repertory', to: 'contacts#search'

	root 'static_pages#home'
end
