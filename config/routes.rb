Rails.application.routes.draw do
  get "/pages/:page", to: "pages#show"
  get "/", to: "pages#show", page: "home"
  get "/home", to: "pages#show", page: "home"
  get "/about", to: "pages#show", page: "about"
  get "/services/details/:id", to: "services#details"
  get "/services/list", to: "services#list"
  get "/services/thankyou", to: "services#thankyou"
  get "/services/emailresults", to: "services#emailresults"
  get "/services", to: "services#show"
  get "/contact", to: "contact#show", page: "contact"
  get "/contact/thankyou", to: "contact#thankyou"

  get "/404", to: "errors#not_found", via: :all
  get "/422", to: "errors#unprocessable_entity", via: :all
  get "/500", to: "errors#internal_server_error", via: :all

  get "/styleguide", to: "pages#styleguide", page: "styleguide"

  root 'pages#show', page: "home"
end
