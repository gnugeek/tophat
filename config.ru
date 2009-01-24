# To use with thin
# thin start -p PORT -R config.ru
 
require 'sinatra'
 
require File.join(File.dirname(__FILE__), 'tophat.rb')
 
set :environment, :development

map "/" do
  run TopHat
end