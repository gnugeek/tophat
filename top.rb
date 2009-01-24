require 'rubygems'
require 'sinatra/base'
require 'json'

module TopHat
  class Top < Sinatra::Base
    
    enable :static, :sessions
    use_in_file_templates!
  
    use Rack::Auth::Basic do |username, password|
      username == 'admin' && password == 'admin'
    end
  
    get '/' do
      %x[ps aux].split('\n').each {|line| @top = line.scan(/(^\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(.+)/) }
      content_type 'application/json'
      @top.to_json
    end
       
  end
end
