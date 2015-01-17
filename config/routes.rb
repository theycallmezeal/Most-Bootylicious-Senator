Rails.application.routes.draw do
  get '/' => "senators#vote"
  get '/new' => "senators#new"
  get '/stats' => "senators#display"
  get '/about' => "senators#about"
  get '/create' => "senators#create"
  post '/create' => "senators#create"
end
