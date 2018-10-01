require 'sinatra'  # Must install sinatra gem first

class HiSinatra < Sinatra::Base
  get '/' do
    "Hey Sinatra!"  
  end

  get '/:age' do
    "Hi, I'm #{params[:age]} years old"
  end
end