require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :admins

  root "pages#home"

  post "/graphql", to: "graphql#execute"

  mount ActionCable.server, at: "/cable"

  mount Sidekiq::Web => "/sidekiq"

  get '/graphiql', to: 'graphiql#index' if Rails.env.development?
end
