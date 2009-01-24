# To use with thin
# thin start -p PORT -R config.ru
 
require 'sinatra'
 
require File.join(File.dirname(__FILE__), 'top.rb')
 
set :environment, :development

map "/top" do
  run TopHat::Top
end
