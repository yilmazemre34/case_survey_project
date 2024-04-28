Rails.application.routes.draw do
  post '/surveys', to: 'surveys#create'
  get '/surveys/survey/:id', to: 'surveys#surveybyid'
  get '/surveys/surveyquestion/:id', to: 'surveys#surveyquestionbyid'
end
