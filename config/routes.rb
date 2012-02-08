ActionController::Routing::Routes.draw do |map|
  map.resources :posts, :collection => { :scrape => :get, :email_one_remailer_user => :get, :inbound => :post }

  map.root :controller => "posts"
end
