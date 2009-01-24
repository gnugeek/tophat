require 'rubygems'
require 'rack'
require 'haml'
require 'sinatra/base'
require 'json'

class TopHat < Sinatra::Base
    
  enable :static, :sessions
  use_in_file_templates!
  
  use Rack::Auth::Basic do |username, password|
    username == 'admin' && password == 'admin'
  end
  
  get '/' do
    %x[ps aux].split('\n').each {|line| @top = line.scan(/(^\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(.+)/) }
    @headers = @top.shift
    haml :tophat
  end
     
  get '/stylesheets/style.css' do
    response['Content-Type'] = 'text/css; charset=utf-8'
    sass :style
  end
  
end

__END__

@@layout
!!!
%html
  %head
    %title Micronatra
    %link{:rel=>"stylesheet", :href=>"/stylesheets/style.css", :type => "text/css"}
  %body
    #banner 
      TopHat
    #nav 
      %a{:href=>("/")}= "HOME"
    #content
      = yield
    #footer
      Powered by Sinatra

@@tophat
%table
  %caption TopHat
  %thead
    %tr
    - @headers.each do |h|
      %th= h
  %tbody
  - @top.each do |line|
    %tr
    - line.each do |item|
      %td= item
      
@@style

a:link
  :color #000

body
  :font-family Arial
  :font-size 10px

#banner
  :text-align left
  :color #fff
  :background #000
  :font-size 12px
  :height 18px
  :padding 2px
  :font-weight bold

#content
  :padding 10px 0px

#nav
  :text-align left
  :color #fff
  :background #ccc
  :font-size 10px
  :font-weight bold
  :padding 2px

#login-form
  :padding 2px

#footer
  :text-align right
  :color #fff
  :background #000
  :font-size 12px
  :font-weight bold
  :height 15px  
  :padding 2px
