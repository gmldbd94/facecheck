Rails.application.routes.draw do
  
  get 'result/result/:id' => "result#result"

  get 'choice/result'
  
  get 'infos/school'

  get 'scafds/new/:score' => "scafds#new"
  
  post 'scafds/create'
  
  get 'choice/first'

  get 'choice/second/:score' => 'choice#second'

  get 'choice/third/:score' => 'choice#third'

  get 'choice/four/:score' => 'choice#four'

  get 'choice/five/:score' => 'choice#five' 

  root 'infos#index'
  
  get 'infos/index'
  
  get '/infos/greats'

  get '/infos/lauren'
  
  get '/infos/mark'
  
  get '/infos/oracle'
  
  get '/infos/paul'
  
  get '/infos/stevejobs'
  
  get '/infos/amancio'
  
  get '/infos/billgates'
  
  get '/infos/dell'
  
end
