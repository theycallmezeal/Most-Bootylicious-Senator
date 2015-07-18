Rails.application.routes.draw do
  get '/' => "senators#vote"
  get '/score' => "senators#score"
  get '/vote' => "senators#vote"
  get '/stats' => "senators#display"
  get '/about' => "senators#about"
end
