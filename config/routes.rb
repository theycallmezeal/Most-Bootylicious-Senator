Rails.application.routes.draw do
  get '/' => "senators#vote"
  get '/vote' => "senators#vote"
  get '/stats' => "senators#display"
  get '/about' => "senators#about"
end
