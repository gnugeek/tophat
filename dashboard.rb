require 'rubygems'
require 'sinatra/base'

module TopHat
  class Dashboard < Sinatra::Base
    enable :static, :sessions
  
    get '/' do
      erb :index
    end
  
  end
end
