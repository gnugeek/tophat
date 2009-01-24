require 'rubygems'
require 'sinatra/base'
require 'sass'

module TopHat
  class Dashboard < Sinatra::Base
    enable :static, :sessions
    use_in_file_templates!
  
    get '/' do
      erb :index
    end

    get '/stylesheets/style.css' do
      content_type 'text/css; charset=utf-8'
      erb :style
    end
       
  end
end

__END__

@@index
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>TopHat</title>
    <script src="jquery-1.3.1.min.js" type="text/javascript"></script>
    <link href='/stylesheets/style.css' rel='stylesheet' type='text/css' />
  </head>
  <body>
    <div id='banner'>TopHat</div>
    
    <div id='content'>
    <table>
      <caption>Top</caption>
      <thead>
        <tr>
          <th>USER</th>
          <th>PID</th>
          <th>%CPU</th>
          <th>%MEM</th>
          <th>VSZ</th>
          <th>RSS</th>
          <th>TT</th>
          <th>STAT</th>
          <th>STARTED</th>
          <th>TIME</th>
          <th>COMMAND</th>
        </tr>
      </thead>
      <tbody>
      </tbody>
    </table>
    </div>
    
    <div id='footer'>
      Powered by Sinatra
    </div>
  </body>
</html>

@@style
  
body {
  font-family: Arial;
  font-size: 12px;
}
