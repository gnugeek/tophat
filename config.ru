# To use with thin
# thin start -p PORT -R config.ru
 
require 'sinatra'
 
require File.join(File.dirname(__FILE__), 'top.rb')
require File.join(File.dirname(__FILE__), 'dashboard.rb')

set :environment, :development

map "/" do
  run TopHat::Dashboard
end

map "/top" do
  run TopHat::Top
end
