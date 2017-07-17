
class Politwit < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :sessions

end
