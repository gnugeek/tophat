require 'rubygems'
require 'sinatra/base'
require 'builder'

module TopHat
  class Top < Sinatra::Base
    
    enable :static, :sessions
 
    get '' do
      get_ps
      content_type "text/xml"
      "#{@xml.target!}"
    end

    private

    def get_ps
      %x[ps aux].split('\n').each {|line| @top = line.scan(/(^\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(.+)/) }
      
      @xml = Builder::XmlMarkup.new
      @xml.instruct! :xml, :version=>"1.0"
      @xml.processes{
        @top.each do |line|
          @xml.process {
            @xml.user(line[0])
            @xml.pid(line[1])
            @xml.cpu(line[2])
            @xml.mem(line[3])
            @xml.vsz(line[4])
            @xml.rss(line[5])
            @xml.tt(line[6])
            @xml.stat(line[7])
            @xml.started(line[8])
            @xml.time(line[9])
            @xml.command(line[10])
          }
        end
      }
    end

  end
end
