Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :blog_entries
  end
  
  resources :blog_entries, path: Spree::Config['blog_alias']

  scope Spree::Config['blog_alias'], as: 'blog' do
    match '/tag/:tag', :to => 'blog_entries#tag', :as => :tag
    match '/category/:category', :to => 'blog_entries#category', :as => :category
    match '/author/:author', :to => 'blog_entries#author', :as => :author
    match '/:year/:month/:day/:slug', :to => 'blog_entries#show', :as => :entry_permalink
    match 'archive/:year(/:month)(/:day)', :to => 'blog_entries#archive', :as => :archive,
          :constraints => {:year => /(19|20)\d{2}/, :month => /[01]?\d/, :day => /[0-3]?\d/}
    match '/feed', :to => 'blog_entries#feed', :as => :feed, :format => :rss
    match '/', :to => 'blog_entries#index'
  end
end