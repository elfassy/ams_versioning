Rails.application.routes.draw do
  resources :posts
  scope "v:api_version" do 
    end
end
