require 'rubygems'
require 'bundler/setup'

# requirements
require 'rss'
require 'open-uri'

require 'logging'

require 'database'
require 'setup'
require 'item'
require 'targets/base'
require 'targets/test'

class App
  def self.read_and_post
    url = 'http://www.holarse-linuxgaming.de/rss.xml'
    open(url) do |rss|
      RSS::Parser.parse(rss).items.each do |item|
        TestTarget.new(item).perform
      end 
    end
  end
end

App.read_and_post
